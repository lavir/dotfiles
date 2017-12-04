#!/usr/bin/env bash

src=/Volumes/Apollo_Comptel/
dst=/Users/lavir/temp-folder/testinit

doIt() {
  installBrew
  initITerm2
  initPathFinder
}

copyTo() {
  mkdir -p "$dst/$2"
  cp -R "$src/$1" "$dst/$2"
}

copyToWithSudo() {
  sudo cp -R "$src/$1" "$dst/$2"
}

installBrew() {
  echo "Installing the Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

initITerm2() {
  echo "Init iTerm2"
  copyTo "/Applications/iTerm.app" "/Applications/"
  copyTo "/Users/lavir/Library/Preferences/com.googlecode.iterm2.plist" "/Users/lavir/Library/Preferences/"
  copyTo "/Users/lavir/Library/Application Support/iTerm2" "/Users/lavir/Library/Application Support/"
  copyTo "/Users/lavir/Library/Saved Application State/com.googlecode.iterm2.savedState" "/Users/lavir/Library/Saved Application State/"
}

initPathFinder() {
  echo "Init PathFinder"

  copyTo "/Applications/Path Finder.app" "/Applications/"
  copyTo "/Users/lavir/Library/Preferences/com.cocoatech.PathFinder.plist" "/Users/lavir/Library/Preferences/"
  copyTo "/Users/lavir/Library/Application Support/Path Finder" "/Users/lavir/Library/Application Support/"
  copyTo "/Users/lavir/Library/Saved Application State/com.cocoatech.PathFinder.savedState" "/Users/lavir/Library/Saved Application State/"
}

read -p "Setup a new Mac. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
