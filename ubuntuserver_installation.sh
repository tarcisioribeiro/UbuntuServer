#!/usr/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install toilet

title_red() {
    echo -e "\033[31m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_green() {
    echo -e "\033[32m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_blue() {
    echo -e "\033[34m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

sudo apt update
sudo apt upgrade -y

echo ""
title_red "Instalação - Parte 1"

title_blue "Instalando dependências necessárias..."

sudo apt install build-essential unzip git neofetch curl wget python3.12-venv net-tools btop python3-venv python3-pip dkms perl gcc make default-libmysqlclient-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev unzip libsqlite3-dev llvm xz-utils tk-dev libffi-dev liblzma-dev python3-openssl bat ruby-full nodejs npm fzf neovim btop -y

sudo timedatectl set-timezone America/Sao_Paulo
mkdir -p ~/Downloads
mkdir -p ~/scripts
mkdir -p ~/repos

title_blue "Alterando o shell padrão bash para o zsh."

title_blue "Certifique-se de digitar corretamente a senha."

read -p "Pressione ENTER para confirmar e prosseguir."

sudo apt install zsh -y
chsh -s /usr/bin/zsh

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

title_red "Instalação - Parte 3"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/UbuntuServer/customization/nvim ~/.config
cp ~/repos/UbuntuServer/customization/bash/.bashrc ~
cp ~/repos/UbuntuServer/customization/bash/.bash_aliases ~
cp ~/repos/UbuntuServer/customization/zsh/.zshrc ~
cp ~/repos/UbuntuServer/customization/zsh/.zsh_aliases ~

source ~/.bashrc

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

source ~/.bashrc

brew install eza glow tldr fd git-delta zoxide