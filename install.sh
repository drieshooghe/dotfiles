#!/usr/bin/env bash

# Variables
PROJECT_DIR=$HOME/projects/personal
UNAME_OUT="$(uname -s)"
case "${UNAME_OUT}" in
    Linux*) OS=Linux ;;
    Darwin*) OS=Mac ;;
    CYGWIN*) OS=Cygwin ;;
    MINGW*) OS=MinGw ;;
    *) echo "${UNAME_OUT} is not a supported dotfile environment" && exit 1 ;;
esac

# Create directories
mkdir -p $PROJECT_DIR

# Install Homebrew
source <(curl -s https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
if [ $? -eq 0 ]; then
    echo -e "\xE2\x9C\x94 Install Homebrew [successful]"
else
    echo -e "\xE2\x9C\x97 Install Homebrew [failed]"
fi

# Install GIT
brew update
brew install git

# Clone repository
mkdir -p $PROJECT_DIR
git clone https://github.com/drieshooghe/dotfiles.git $PROJECT_DIR/dotfiles
cd $PROJECT_DIR/dotfiles

# Import utils
source ./utils/prompt.sh

# brew analytics off
# brew install git

# Setup Homebrew
# brew tap homebrew/bundle
# brew bundle
