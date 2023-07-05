#!/bin/bash -ex
DOTFILE_PATH=$(pwd)
if [ ! -d ~/.oh-my-zsh ]; then
    curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- -y
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
    force=$3
    if [ -e "$dest" ] && [ -n "$force" ]; then
      rm "$dest"
    fi
    if [ -e "$dest" ]; then
        echo "$dest exists. Skipping."
    else
        mkdir -p "$(dirname "$dest")"
        ln -s "$src" "$dest"
    fi
}
create_symlink "$DOTFILE_PATH"/dot-profile ~/.profile FORCE
create_symlink "$DOTFILE_PATH"/dot-tmux.conf ~/.tmux.conf FORCE 
create_symlink "$DOTFILE_PATH"/dot-tmux ~/.tmux
create_symlink "$DOTFILE_PATH/dot-config/nvim" ~/.config/nvim
create_symlink "$DOTFILE_PATH/dot-zshrc" ~/.zshrc FORCE
