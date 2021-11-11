#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

