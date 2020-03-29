#!/bin/bash

# Define dotfiles command for script. '$@' expands all arguments.
function dotfiles {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# Ignore directory to avoid recursion issues when checking out
echo ".dotfiles" >> .gitignore

echo "Cloning GitHub repository."
git clone --bare https://github.com/SeanMSullivan/dotfiles.git $HOME/.dotfiles

echo "Checking out dotfiles."
dotfiles checkout

# If checkout returns 0
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    mkdir -p .dotfiles-backup
    echo "Backing up pre-existing dotfiles in './.dotfiles-backup'.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;

echo "Files backed up, checking out dotfiles again."
dotfiles checkout

echo "Set local git config flag to hide untracked files."
dotfiles config status.showUntrackedFiles no

# Save and activate alias
echo "alias dotfiles='git --git-dir=$'HOME'/.dotfiles/ --work-tree=$'HOME''" >> $HOME/.bash_aliases
source $HOME/.bash_aliases

