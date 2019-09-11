#!/bin/sh

confirm() {
	read -r -p "Proceed with $2 setup for $1? [y/N] " answer
	if [ "$answer" != y ] && [ "$answer" != Y ]; then
		echo "Setup declined..."
		echo "Now exiting."
		exit
	else
		./$1_$2.sh
	fi
}

COLUMNS=12

PS3="Please select an option: "

options=(
	"Packages for Arch Linux"
	"Configuration for Arch Linux"
	"Dotfiles for Arch Linux"
	"Dotfiles for macOS"
	"Quit"
)

select opt in "${options[@]}"
do
	case $opt in
		"Packages for Arch Linux")
			confirm "arch" "packages"
			break
			;;
		"Configuration for Arch Linux")
			confirm "arch" "configuration"
			break
			;;
		"Dotfiles for Arch Linux")
			confirm "arch" "dotfiles"
			break
			;;
		"Dotfiles for macOS")
			confirm "macos" "dotfiles"
			break
			;;
		"Quit")
			break
			;;
		*) echo "Invalid option: $REPLY";;
	esac
done
