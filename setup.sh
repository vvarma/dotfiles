#!/bin/bash -ex
DOTFILE_PATH=$(pwd)
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if [ ! -d ~/.zplug/ ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
mkdir -p ~/.config

create_symlink(){
    src=$1
    dest=$2
    if [ -e "$dest" ]; then
        echo "$dest exists. Skipping."
    else
        mkdir -p "$(dirname "$dest")"
        ln -s "$src" "$dest"
    fi
}
create_symlink "$DOTFILE_PATH"/dot-profile ~/.profile
create_symlink "$DOTFILE_PATH"/dot-tmux.conf ~/.tmux.conf
create_symlink "$DOTFILE_PATH"/dot-tmux ~/.tmux
create_symlink "$DOTFILE_PATH/dot-config" ~/.config/nvim
create_symlink "$DOTFILE_PATH/dot-zshrc" ~/.zshrc
