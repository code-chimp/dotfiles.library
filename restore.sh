#!/usr/bin/env bash

cwd=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
dry="0"

home_content_dirs="fonts,git,npm,tmux,vim,zsh"

# FZF Fix
fzf_version=$(fzf --version | awk '{print $1}' | cut -d. -f1)
if [ $fzf_version -lt 48 ]; then
    home_content_dirs="$home_content_dirs,fzf"
fi

while [[ $# > 0 ]]; do
    key="$1"
    case $key in
        -d|--dry)
            dry="1"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

log() {
    if [[ $dry == "1" ]]; then
        echo "[DRY RUN] $@"
    else
        echo "$@"
    fi
}

execute() {
    if [[ $dry == "1" ]]; then
        return
    else
        "$@"
    fi
}

log "Restoring dotfiles from $cwd"

## boss editorconfig file
for dir in $(echo $home_content_dirs | tr "," "\n"); do
    log "Copying $dir to $HOME"
    execute cp -r $cwd/$dir/. $HOME
done

if [ ! -d $HOME/work ]; then
    log "Creating work directory in $HOME"
    execute mkdir $HOME/work
fi

log "Copying editorconfig to $HOME"
execute cp -r $cwd/editorconfig/. $HOME/work
