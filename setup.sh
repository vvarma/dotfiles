#!/bin/bash -ex
DOTFILE_PATH=$(pwd)
if [ ! -d ~/.zplug/ ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

create_symlink(){
    src=$1
    dest=$2
    if [ -e "$dest" ]; then
        echo "$dest exists. Skipping."
    else
        ln -s "$src" "$dest"
    fi
}
create_symlink "$DOTFILE_PATH"/dot-profile ~/.profile
create_symlink "$DOTFILE_PATH"/dot-tmux.conf ~/.tmux.conf
create_symlink "$DOTFILE_PATH"/dot-tmux ~/.tmux
create_symlink "$DOTFILE_PATH/nvim" ~/.config/nvim
create_symlink "$DOTFILE_PATH/dot-zshrc" ~/.zshrc
