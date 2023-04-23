使用stow管理dotfiles

- `base` 为系统通用配置
- `arch` 为archlinx特有配置
- `macos` 为macos特有配置
- `modules` 为多系统中同样配置文件中同样配置，方便其他系统特有配置引用

## arch
```sh
sudo pacman -S stow 
git clone git@github.com:tsingksan/.dotfiles.git ~/Documents
rm -rf ~/.config/alacritty ~/.config/nvim ~/.config/tmux ~/.config/starship ~/.config/git ~/.zshrc ~/.yarnrc
mkdir ~/.config/alacritty
cd ~/Documents/.dotfiles && stow base -t ~
cd ~/Documents/.dotfiles/os && stow arch -t ~
```