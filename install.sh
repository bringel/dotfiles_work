#! /bin/bash

create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done

    echo "Creating symlink to tmuxinator in home directory."
    rm -rf ~/.conf/tmuxinator
    ln -s $script_dir/tmuxinator ~/.conf/tmuxinator
}

install_tmux() {
    sudo apt-get install tmux
    gem insatll tmuxinator
}

install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_spaceship_prompt() {
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}

set_shell() {
    sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
}

create_symlinks
install_oh_my_zsh
install_spaceship_prompt
install_tmux
set_shell
