#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'
# Make current directory the directory of the script
cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null
scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
