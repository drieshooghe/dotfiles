#!/bin/bash

# Determine OS
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          echo "${unameOut} is not a supported dotfile environment" && exit 1;;
esac

# Install Homebrew
source <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)