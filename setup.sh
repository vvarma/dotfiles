#!/bin/bash -ex
DOTFILE_PATH=`pwd`

create_symlink(){
    src=$1
    dest=$2
    if [ -e "$dest" ]; then
        echo "$dest exists. Skipping."
    else
        ln -s $src $dest
    fi
}
create_symlink $DOTFILE_PATH/dot-profile ~/.profile
create_symlink $DOTFILE_PATH/dot-vimrc ~/.vimrc
create_symlink $DOTFILE_PATH/dot-vim/ ~/.vim
create_symlink $DOTFILE_PATH/dot-tmux-powerlinerc ~/.tmux-powerlinerc 
create_symlink $DOTFILE_PATH/dot-tmux.conf ~/.tmux.conf
create_symlink $DOTFILE_PATH/tmuxifier ~/.tmuxifier
create_symlink $DOTFILE_PATH/dot-tmux ~/.tmux
