#!/usr/bin/env bash

echo "STARTING zpallin/toolkit SETUP"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

################################################################################
# copy bashrc and vimrc so you don't loose it
if [ -f ~/.bashrc ]; then
  echo " - Saving old bashrc to ~/.bashrc.orig"
  cp ~/.bashrc ~/.bashrc.orig
fi

if [ -f ~/.vimrc ]; then
  echo " - Saving old vimrc to ~/.vimrc.orig"
  cp ~/.vimrc ~/.vimrc.orig
fi

if [ -f ~/.inputrc ]; then
  echo " - Saving old inputrc to ~/.inputrc.orig"
  cp ~/.inputrc ~/.inputrc.orig
fi

################################################################################
# now, copy the bash config files
echo " - Copying new bashrc, vimrc, and inputrc files to locations"
cp bash/bash.bashrc ~/.bashrc
cp vim/zpallin.vimrc ~/.vimrc
cp bash/inputrc ~/.inputrc

echo " - Copying bash includes where custom code can be stored safely"
mkdir -p ~/.bash_includes
cp -rf bash/includes/* ~/.bash_includes/

################################################################################
# initiate the new bash env
echo "ENABLING bashrc"
source ~/.bashrc

################################################################################
# move to the toolkit
cd $DIR

################################################################################
# errors schmerrors
echo "FINISHED"
