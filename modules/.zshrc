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
gpg-connect-agent updatestartuptty /bye >/dev/null
# if ! pgrep -x "gpg-agent" > /dev/null
# then
#     gpg-agent --daemon
# fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

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