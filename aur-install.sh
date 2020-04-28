#!/bin/sh

# No args
[ -z "$1" ] && echo "Error: no package specified" && exit

# Make sure the directory exists
[ -d "$HOME/.aur-install" ] || mkdir "$HOME/.aur-install"
# Check if already downloaded
[ -d "$HOME/.aur-install/$1" ] && \
	read -p "It appears you have already downloaded this package, do you wish to redownload or install from disc? [r/d] (redownload/disc) " aurrd && \
	[ "$aurrd" = "d" ] || rm "$HOME/.aur-install/$1" -rf

# Don't redownload if disk option was selected
[ "$aurrd" = "d" ] || git clone "https://aur.archlinux.org/$1.git" "$HOME/.aur-install/$1"

# Install the package
echo "Installing..."
cd "$HOME/.aur-install/$1" && \
	makepkg --install

read -p "Do you want to remove the downloaded directory? (This will not affect the install) [y/n] " yn
[ "$yn" = "y" ] && rm "$HOME/.aur-install/$1" -rf # Only clean up files if install was successfull
