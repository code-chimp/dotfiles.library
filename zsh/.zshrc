# Path to your oh-my-zsh installation.
export ZSH="/home/tgoshinski/.oh-my-zsh"

# make sure we're getting full color
[ -z "$TMUX" ] && export TERM=xterm-256color

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="dracula"

plugins=(
  git
  docker
  docker-compose
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Advanced Docker
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export PATH="$HOME/bin:$HOME/.local/bin:$HOME/local/bin:/usr/local/bin:$PATH"

# GOOGLE LOVE
export GOROOT="/usr/local/go"
export GOARCH="amd64"
export GOOS="linux"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

#  Android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Flutter 2
export PATH="$PATH:$HOME/flutter/bin"

# .NET Core
export PATH="$HOME/.dotnet/tools:$PATH"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Deno - https://deno.land
export DENO_DIR="$HOME/.cache/deno"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Volta
export VOLTA_FEATURE_PNPM=1
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Open system browser from WSL
# export BROWSER=wslview

# find snap applications
emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

alias zshconfig="gvim ~/.zshrc"
alias ohmyzsh="gvim ~/.oh-my-zsh"
alias tmux="TERM=screen-256color-bce tmux"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(~/.rbenv/bin/rbenv init - zsh)"
eval "$(starship init zsh)"
