#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
# brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Fish Shell.
# running `chsh`.

brew install fish
brew tap homebrew/versions
brew tap Caskroom/cask

# Switch to using brew-installed fish as default shell
if ! fgrep -q '/usr/local/bin/fish' /etc/shells; then
  echo '/usr/local/bin/fish' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/fish;
  curl -L https://get.oh-my.fish | fish
fi;

# Mac App Store command-line interface
brew install mas

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
#brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install openssl
brew install homebrew/dupes/screen
# brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.

brew install aircrack-ng
brew install dns2tcp
brew install hydra

# Install other useful binaries.
# Search tool like grep, but optimized for programmers
# brew install ack
brew install git

# Use GraphicsMagick instead
# brew install imagemagick --with-webp
brew install ghostscript
brew install graphicsmagick

# Image manipulation library
# http://www.ijg.org
brew install jpeg

brew install Caskroom/cask/ksdiff
brew install duti
brew install exiftool
brew install ffmpeg
brew install htop-osx
brew install httpie
brew install n
brew install p7zip
# Monitor data's progress through a pipe
brew install pv
brew install python
brew install python3
brew install speedtest_cli
# SSH server auditing (https://github.com/arthepsy/ssh-audit)
brew install ssh-audit
# Tool which checks for the support of TLS/SSL ciphers and flaws (https://testssl.sh/)
brew install testssl
brew install tree
brew install youtube-dl

# Command-line tool to manage your ssh connections
# https://github.com/emre/storm
brew install stormssh

# Version Control Visualization Tool
# brew install gource

# DNS benchmark utility
# brew install namebench

# For the copy-to-pluto script
# brew install jhead
brew install terminal-notifier
# brew install nmap


# Install Hammerspoon (http://www.hammerspoon.org/)
# brew tap Caskroom/cask
# brew install Caskroom/cask/hammerspoon
# Remove outdated versions from the cellar.
brew cleanup
