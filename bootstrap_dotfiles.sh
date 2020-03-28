#!/bin/bash

# This script bootstraps a dotfiles git repository for backing up and
# synchronizing dotfiles in the user home directory

# set git to use based on running bash in MINGW on Windows or linux bash
if uname -a | grep -q MINGW; then
    # MINGW
    GIT=\$'HOME'/AppData/Local/Programs/Git/mingw64/bin/git.exe
else
    # Linux
    GIT=/usr/bin/git
fi

# Create bare git repository
git init --bare $HOME/.dotfiles

# Add alias 'dotfiles' used in place of 'git' for this repository
# alias dotfiles='$GIT --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Set local git config flag to hide untracked files
$dotfiles config --local status.showUntrackedFiles no

# Save alias int .bash_aliases
echo "alias dotfiles='$GIT --git-dir=$'HOME'/.dotfiles/ --work-tree=$'HOME''" >> $HOME/.bash_aliases

# Activate alias
source ~/.bash_aliases

