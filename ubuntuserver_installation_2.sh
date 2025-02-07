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

title_red "Instalação - Parte 2"

title_blue "Instalando o OH My ZSH"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sleep 3

cd ~
mkdir -p ~/repos
mkdir -p ~/.icons
mkdir -p ~/.themes
cd ~/repos
git clone https://github.com/tarcisioribeiro/ExpenseLit.git
git clone https://github.com/tarcisioribeiro/StreamFort.git

cp ~/repos/UbuntuServer/customization/git/.gitconfig ~
cp ~/repos/UbuntuServer/customization/tmux/.tmux.conf ~
mkdir -p ~/.config/autostart
cp -r ~/repos/UbuntuServer/customization/btop ~/.config
cp ~/repos/UbuntuServer/customization/starship/starship.toml ~/.config
cd ~/Downloads
wget https://github.com/dracula/zsh-syntax-highlighting/archive/master.zip
unzip master.zip
cp zsh-syntax-highlighting-master/zsh-syntax-highlighting.sh ~/scripts
sudo rm -r zsh-syntax-highlighting-master/
rm master.zip

cp ~/repos/UbuntuServer/customization/bash/logo-ls_Linux_x86_64.tar.gz ~/Downloads
cd ~/Downloads
tar -zxf logo-ls_Linux_x86_64.tar.gz
cd ~/Downloads/logo-ls_Linux_x86_64
sudo cp logo-ls /usr/local/bin
cd ~/Downloads
rm logo-ls_Linux_x86_64.tar.gz
sudo rm -r logo-ls_Linux_x86_64/

read -p "Pressione ENTER para confirmar e sair."