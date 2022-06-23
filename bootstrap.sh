#!/bin/bash

# Import utils
source ./utils/prompt.sh

# Variables
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          echo "${unameOut} is not a supported dotfile environment" && exit 1;;
esac

# Install Homebrew
source <(curl -s https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
logResult "Install Homebrew"

