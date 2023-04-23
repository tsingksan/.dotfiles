export PATH="$HOME/.cargo/bin:$PATH" 		      # cargo
# export GOPATH="$HOME/Documents/GOPATH"        # go
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

# starship 自动补全  /usr/local/bin
eval "$(starship init zsh)"

plugins=(
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
  # zsh-autosuggestions
  # zsh-syntax-highlighting
  # zsh-wakatime
  # zsh-history-substring-search
)

export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
echo UPDATESTARTUPTTY | gpg-connect-agent 1> /dev/null

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

# where proxy
proxy() {
  export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897
  echo "https_proxy=http://127.0.0.1:7897\nhttp_proxy=http://127.0.0.1:7897\nall_proxy=socks5://127.0.0.1:7897"
}

# where noproxy
noproxy () {
  unset http_proxy https_proxy all_proxy
  echo "HTTP Proxy off"
}
