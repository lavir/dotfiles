#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

DEST_PATH=/Users/lavir/temp-folder/dotfiles_desc
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR_NAME="backups"
BACKUP_PATH="$(pwd)/$BACKUP_DIR_NAME/$TIMESTAMP"

function iterm2Integration() {
	curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
}

function cleanupBackupDir() {
	echo "Remove empty dirs in the $BACKUP_DIR_NAME"
	find "$(pwd)/$BACKUP_DIR_NAME" -type d -depth 1 -empty -delete
}

function createBackupDir () {
	echo "Make backup dir: $BACKUP_PATH"
	mkdir $BACKUP_PATH
}

function doIt() {
	cleanupBackupDir;
	createBackupDir;
	
	rsync --exclude-from=.excluded_from_sync \
				--backup-dir=$BACKUP_PATH \
				-avhb --no-perms . $DEST_PATH;

	iterm2Integration;
	source ~/.bash_profile;
}

function doItDry() {
	rsync --exclude-from=.excluded_from_sync \
		-avhn --no-perms . $DEST_PATH;
	source ~/.bash_profile;
}

case "$1" in
	--force|-f)
			doIt;
		;;
	--dry)
			doItDry;
		;;
*)
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
	;;
esac

unset doIt;
unset doItDry;
