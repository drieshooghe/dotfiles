#!/bin/bash

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
if [ $? -eq 0 ]; then
    echo -e "\xE2\x9C\x94 Install Homebrew [successful]"
else
    echo -e "\xE2\x9C\x97 Install Homebrew [failed]"
fi

# Setup Homebrew
brew analytics off
brew update
brew tap homebrew/bundle
brew bundle

# Clone repository


# Import utils
# source ./utils/prompt.sh

