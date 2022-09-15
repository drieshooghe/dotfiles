#!/bin/bash
set -u

# Functions
success() {
    echo -e "\xE2\x9C\x94 $1" >&2
}
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

# Clone repository
mkdir -p $PROJECT_DIR
git clone https://github.com/drieshooghe/dotfiles.git $PROJECT_DIR/dotfiles
cd $PROJECT_DIR/dotfiles
success "Cloned dotfiles repository"

# Symlink config files
ln -s ./src/config $HOME/.config
ln -s ./src/bashrc $HOME/.bashrc
ln -s ./src/bash_profile $HOME/.bash_profile

# Install Homebrew
source <(curl -s https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
success "Homebrew installation successful"
brew analytics off
brew update

# Setup Homebrew
brew tap homebrew/bundle
brew bundle

# Setup node version
n lts
success "Installed Node"
