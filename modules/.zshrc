export PATH="$HOME/.cargo/bin:$PATH" 		      # cargo
# export GOPATH="$HOME/Documents/GOPATH"        # go
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

# starship 自动补全  /usr/local/bin
eval "$(starship init zsh)"

plugins=(
  1password
  git
  npm
  nvm
  yarn
  rust
  git-commit
  starship
  z
  pnpm-shell-completion
  fzf-tab
  forgit
  gpg-agent
  # zsh-autosuggestions
  # zsh-syntax-highlighting
  # zsh-wakatime
  # zsh-history-substring-search
)

# Set the default editor
alias vim='nvim'
alias svim='sudo nvim'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

function cd() {
  builtin cd "$@" && ls
}

proxy() {
  export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
}

noproxy () {
  unset http_proxy https_proxy all_proxy
  echo "HTTP Proxy off"
}

if [ -z "$https_proxy" ]; then
  proxy
fi
