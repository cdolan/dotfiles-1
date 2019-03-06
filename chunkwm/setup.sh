#!/bin/bash

red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
cyan="$(tput setaf 6)"
bold="$(tput bold)"
reset="$(tput sgr0)"

info() {
	echo "${cyan}$1${reset}"
}

alert() {
	echo "${yellow}$1${reset}"
}

success() {
	echo "${green}$1${reset}"
}

error() {
	echo "${red}$1${reset}"
}

symlink() {
	ln -sfv "$(PWD)/$1" "$HOME/$1" || error "Failed to symlink $1"
}

initialize() {
	read -r -p "${bold}Install ChunkWM/SKHD config? ${reset}[y/N] " answer
	if [ "$answer" != y ] && [ "$answer" != Y ]; then
		error "Installation declined..."
		info "Now exiting."
		exit
	else
		setup
	fi
}

setup() {
	info "Setting up ChunkWM/SKHD config..."

	symlink ".chunkwmrc"
	symlink ".skhdrc"

	success "Done."
}

initialize