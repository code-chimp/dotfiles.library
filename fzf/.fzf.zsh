# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tgoshinski/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tgoshinski/.fzf/bin"
fi

## Remove if 48 comes to Ubutnu
# Auto-completion
#----------------
[[ $- == *i* ]] && source "/home/tgoshinski/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
#-------------
source "/home/tgoshinski/.fzf/shell/key-bindings.zsh"

## Add if 48 comes to Ubuntu
# source <(fzf --zsh)
