#!/bin/bash
set -u

# Functions
abort() {
    echo -e "\xE2\x9C\x97 $1" >&2
    exit 1
}

# Checks
if [ -z "${BASH_VERSION:-}" ]; then
    abort "Bash is required to interpret this script."
fi

# Variables
PROJECT_DIR=$HOME/projects/personal
case $(uname -s) in
    Linux*) OS=Linux ;;
    Darwin*) OS=Mac ;;
    *) echo "$(uname -s) is not a supported dotfile environment" && exit 1 ;;
esac

# Create directories
mkdir -p $PROJECT_DIR

# Install Homebrew
source <(curl -s https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
echo -e "\xE2\x9C\x94 Homebrew installation successful"
brew analytics off
brew update

# Clone repository
mkdir -p $PROJECT_DIR
git clone https://github.com/drieshooghe/dotfiles.git $PROJECT_DIR/dotfiles
cd $PROJECT_DIR/dotfiles

# Import utils
source ./utils/prompt.sh

# Setup Homebrew
brew tap homebrew/bundle
brew bundle
