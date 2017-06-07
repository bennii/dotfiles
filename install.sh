#!/bin/bash

# Install script to install the dotfiles of my personal dotfiles repository.
# There is no warranty that this script will work properly. If data is lost, I am not responsible.
# Even though this script is supposed to make a backup if there are existing dotfiles, it is your
# own responsibility to make sure that those files are properly saved.

PATH_I3="$HOME/.config/i3"
PATH_NEOVIM="$HOME/.config/nvim/"
PATH_NCMCPP="$HOME/.ncmpcpp"

function usage() {
    printf "%s" "\
Usage: ./install.sh or bash install.sh [OPTIONS]
Example: ./install.sh --full
    This example will install all possible dotfiles
    
OPTIONS:
-h              display this help.
-full           will install every dotfile.
--no-backup     no backup of preexisting dotfiles: WARNING, THEY ARE OVERRIDEN.
"
}

function evalParameters() {
    while getopts "h" opt; do
        case "$opt" in
            "h") usage; exit ;;
        esac
    done
}

function analyzingPaths() {
    echo "Analyzing existing paths."

    echo $PATH_I3
    echo $PATH_NEOVIM
    echo $PATH_NCMCPP
}

function backupDotfiles() {
    echo "Backing up existing dotfiles."
    echo "Backup created."
}

function installDotfiles() {
    echo "Installing dotfiles."
    echo "Installing finished. Restart programs if necessary."
}

function main() {
    evalParameters "$@"

    analyzingPaths

    backupDotfiles

    installDotfiles
}

main "$@"
