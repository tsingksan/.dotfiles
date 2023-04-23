source ~/Documents/.dotfiles/modules/.zshrc

source /usr/share/nvm/init-nvm.sh
export CHROME_EXECUTABLE=/usr/bin/chromium

export ZSH="/usr/share/oh-my-zsh"             # oh my zsh
source $ZSH/oh-my-zsh.sh

alias update='sudo pacman -Syu && yay -Syu'
alias hh='yarn hardhat'

# pnpm
export PNPM_HOME="/home/todd/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
