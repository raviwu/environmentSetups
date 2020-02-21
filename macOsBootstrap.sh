#!/usr/bin/env bash
#
# Bootstrap script for setting up a new OSX machine
#
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - Twitter (app store)
# - Postgres.app (http://postgresapp.com/)
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Reading:
#
# - http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# - https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716
# - https://news.ycombinator.com/item?id=8402079
# - http://notes.jerzygangi.com/the-best-pgp-tutorial-for-mac-os-x-ever/

echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install ansible
git clone git://github.com/ansible/ansible.git
cd ./ansible
source ./hacking/env-setup
sudo easy_install pip
sudo pip install paramiko PyYAML jinja2

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/versions
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install zsh
brew install zsh

# Install Oh-My-Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

PACKAGES=(
    autoconf
    automake
    elixir
    erlang
    ffmpeg
    git
    git-flow
    graphviz
    hub
    imagemagick
    libjpeg
    markdown
    mercurial
    mongodb
    mysql
    node
    npm
    openssh
    openssl
    phantomjs
    postgresql
    rbenv
    redis
    ssh-copy-id
    terminal-notifier
    tmux
    tree
    vim
    wget
    yarn
    zsh-completion
    zsh-syntax-highlighting
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup && brew cask cleanup

echo "Installing cask..."
brew tap caskroom/cask/brew-cask

CASKS=(
    1password
    firefox
    flux
    fork
    gitup
    google-chrome
    google-drive-file-stream
    iterm2
    macvim
    postman
    skype
    slack
    vagrant
    virtualbox
    vlc
    visual-studio-code --verbose
    welly
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-roboto
    font-clear-sans
)
brew cask install ${FONTS[@]}

echo "Installing Ruby gems"
RUBY_GEMS=(
    bundler
    filewatcher
    cocoapods
    rubocop
)
sudo gem install ${RUBY_GEMS[@]}

echo "Installing global npm packages..."
npm install marked -g

echo "Configuring OSX..."

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Creating folder structure..."
[[ ! -d Wiki ]] && mkdir Wiki
[[ ! -d Workspace ]] && mkdir Workspace

echo "Starting Services"
SERVICES=(
    mysql
    postgresql
    redis
)
brew services start ${SERVICES[@]}

echo "Bootstrapping complete"
