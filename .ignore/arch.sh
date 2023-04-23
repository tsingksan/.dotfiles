sudo su
pacman -Syu


sudo pacman -S fzf


cd ~/Documents
git clone https://github.com/lqsbznh/dotfiles

linkConfig() {
    # mkdir out

    FILE=~/.zshrc
    if test -f "$FILE"; then
        mv ~/.zshrc ~/.zshrc.bak
    fi
}

installYay() {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    yay -Syu
    cd ..
    rm -rf yay

    pacman -S stow
}

installStarship(){
    if command_exists starship; then
        echo "Starship already installed"
        return
    fi

    yay -S oh-my-zsh-git

    if ! pacman -S starship ttf-hack-nerd zsh ;then
        echo -e "${RED}Something went wrong during starship install!${RC}"
        exit 1
    fi
}

sudo pacman -S zsh-autosuggestions community/zsh-syntax-highlighting
installYay
installStarship