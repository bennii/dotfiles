#!/bin/bash

# Install script to install the dotfiles of my personal dotfiles repository.
# There is no warranty that this script will work properly. If data is lost, I am not responsible.
# Even though this script is supposed to make a backup if there are existing dotfiles, it is your
# own responsibility to make sure that those files are properly saved.
#
# For your own safety: do not read this bash script.

PATH_I3="$HOME/.config/i3/"
PATH_NVIM="$HOME/.config/nvim/"
PATH_XINITRC="$HOME/.xinitrc"
PATH_NCMPCPP="$HOME/.ncmpcpp"
PATH_XRESOURCES="$HOME/.Xresources"

BACKUP_DO=true
BACKUP_DIR=$HOME/DotfileBackup

INSTALL_I3=true
INSTALL_NVIM=true
INSTALL_XINITRC=true
INSTALL_NCMPCPP=true
INSTALL_XRESOURCES=true

function usage() {
    printf "%s" "\
Usage: ./install.sh or bash install.sh [OPTIONS]
Example: ./install.sh --full
    This example will install all possible dotfiles
    
OPTIONS:
-b              Backup directory to use.
-h              display this help.
-full           will install every dotfile.
--no-backup     no backup of preexisting dotfiles: WARNING, THEY ARE OVERRIDEN. NOT RECOMMENDED.
"
}

function evalParameters() {
    while getopts "h" opt; do
        case "$opt" in
            "h") usage; exit ;
        esac
    done
}

function analyzingPaths() {
    echo "Analyzing existing paths."

    if [ $INSTALL_I3 ] ; then
        if [ -d $PATH_I3 ] ; then
            echo "i3 path was found."
        else
            PATH_I3=$HOME/.i3/
            
            if [ -d $PATH_I3=false ] ; then
                BACKUP_I3=false
            fi
        fi
    fi

    if [ $INSTALL_NVIM ] ; then
        if [ -d $PATH_NVIM ] ; then
            echo "NeoVim path was found."
        else
            BACKUP_NVIM=false
        fi
    fi

    if [ $INSTALL_NCMPCPP ] ; then
        if [ -d $PATH_NCMPCPP ] ; then
            echo "ncmpcpp path was found."
        else
            BACKUP_NCMPCPP=false
        fi
    fi

    if [ $INSTALL_XINITRC ] ; then
        if [ -d $PATH_XINITRC ] ; then
            echo "ncmpcpp path was found."
        else
            BACKUP_NCMPCPP=false
        fi
    fi

    if [ $INSTALL_XRESOURCES ] ; then
        if [ -d $PATH_XRESOURCES ] ; then
            echo "ncmpcpp path was found."
        else
            BACKUP_NCMPCPP=false
        fi
    fi
}

function backupDotfiles() {
    if [ $BACKUP_DO ] ; then
        echo "Backing up existing dotfiles."

        if [ -d $BACKUP_DIR ] ; then
            $(mv $BACKUP_DIR $BACKUP_DIR"Old")
        fi

        $(mkdir $BACKUP_DIR)

        if [ $INSTALL_NVIM ] ; then
            cp $PATH_NVIM $BACKUP_DIR -R
        fi
        
        if [ $INSTALL_I3 ] ; then
            cp $PATH_I3 $BACKUP_DIR -R
        fi

        if [ $INSTALL_XINITRC ] ; then
            cp $PATH_XINITRC $BACKUP_DIR"/xinitrc"
        fi

        if [ $INSTALL_XRESOURCES ] ; then
            cp $PATH_XRESOURCES $BACKUP_DIR"/Xresources"
        fi

        echo "Backup created."
    fi
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
