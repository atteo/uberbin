#!/bin/bash


scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $scriptDirectory/__settings.sh


# Checks if given command is available, if not starts apt-get to install the package which provides
# the command
# TODO: currently supports only Debian/Ubuntu
requiresCommand() {
	local command="$1"

	command -v "$command" >/dev/null 2>&1 || {
		echo >&2 "-------------------------------------------------------------------------"
		echo >&2 "This command requires '$command' command, but it was not found on this system."

		command -v "apt-file" >/dev/null 2>&2 || {
			echo >&2 "Installing 'apt-file' which allows to search for command providers"
			sudo apt-get -qy install apt-file
			sudo apt-file update
		}

		echo >&2 "Searching for '$command' in repositories using 'apt-file':"
		local package="$(apt-file search --package-only --regexp "^/(usr/)?bin/$command\$")"
		if [[ -z "$package" ]]; then
			echo >&2 "Cannot find package which provides '$command'. Exitting."
			exit 1
		fi
		echo >&2 "Command '$command' found in package '$package'. Installing the packge..."

		sudo apt-get -qy install "$package"

		echo >&2 "-------------------------------------------------------------------------"

	}
}

