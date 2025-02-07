#!/usr/bin/bash
title_red() {
    echo -e "\033[31m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_green() {
    echo -e "\033[32m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_blue() {
    echo -e "\033[34m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_red "Instalação - Parte 4"

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/UbuntuServer/customization/nvim ~/.config
cp ~/repos/UbuntuServer/customization/bash/.bashrc ~
cp ~/repos/UbuntuServer/customization/bash/.bash_aliases ~
cp ~/repos/UbuntuServer/customization/zsh/.zshrc ~
cp ~/repos/UbuntuServer/customization/zsh/.zsh_aliases ~

read -p "Pressione ENTER para confirmar e sair."