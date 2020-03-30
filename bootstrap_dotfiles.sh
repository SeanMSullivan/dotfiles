#!/bin/bash

# This script bootstraps a dotfiles git repository for backing up and
# synchronizing dotfiles in the user home directory

# Create bare git repository
git init --bare $HOME/.dotfiles

# Add alias 'dotfiles' used in place of 'git' for this repository
# alias dotfiles='$GIT --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Set local git config flag to hide untracked files
$dotfiles config --local status.showUntrackedFiles no

# Save alias int .bash_aliases
echo "alias dotfiles='git --git-dir=$'HOME'/.dotfiles/ --work-tree=$'HOME''" >> $HOME/.bash_aliases

# Activate alias
. "$HOME/.bash_aliases"

