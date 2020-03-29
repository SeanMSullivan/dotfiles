#!/bin/bash

# Save alias
echo "alias dotfiles='git --git-dir=$'HOME'/.dotfiles/ --work-tree=$'HOME''" >> $HOME/.bash_aliases

# Ignore directory to avoid recursion issues when checking out
echo ".dotfiles" >> .gitignore

# Clone my GitHub directory
git clone --bare https://github.com/SeanMSullivan/dotfiles.git $HOME/.dotfiles

# Set command for script
dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

echo "1"
# Backup local dotfiles
mkdir -p .dotfiles-backup && \
$dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}

echo "2"
# Download online files
$dotfiles checkout

echo "3"
# Set local git config flag to hide untracked files
$dotfiles config --local status.showUntrackedFiles no

