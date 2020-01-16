#!/bin/sh

confirm() {
	read -r -p "Proceed with $1 setup for $2? [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo "Setup declined..."
		echo "Now exiting."
		exit
	else
		./$1.sh
	fi
}

COLUMNS=12

PS3="Please select an option: "

declare -a options=(
	"Arch Linux - Dotfiles"
	"Arch Linux - Packages"
	"Arch Linux - Config"
	"MacOS - Dotfiles"
	"Quit"
)

select opt in "${options[@]}"
do
	case $opt in
		"Arch Linux - Dotfiles")
			confirm "dotfiles" "Arch Linux"
			break
			;;
		"Arch Linux - Packages")
			confirm "packages" "Arch Linux"
			break
			;;
		"Arch Linux - Config")
			confirm "config" "Arch Linux"
			break
			;;
		"Arch Linux - Config")
			confirm "config" "Arch Linux"
			break
			;;
		"MacOS - Dotfiles")
			confirm "macos" "MacOS"
			break
			;;
		"Quit")
			echo "Quitting..."
			break
			;;
		*) echo "Invalid option: $REPLY";;
	esac
done
