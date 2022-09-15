#!/bin/zsh
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
if [ -z "${ZSH_VERSION:-}" ]; then
    abort "Zsh is required to interpret this script."
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
ln -s $PROJECT_DIR/dotfiles/src/config $HOME/.config
ln -s $PROJECT_DIR/dotfiles/src/zshrc $HOME/.zshrc
ln -s $PROJECT_DIR/dotfiles/src/zprofile $HOME/.zprofile

# Install Homebrew
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
success "Homebrew installation successful"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off
brew update

# Setup Homebrew
brew tap homebrew/bundle
brew bundle
