[ ! -f ~/.fzf.bash -a -f ~/.fzf/install ] && ~/.fzf/install

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

mkdir -p ~/.local/share/fzf

export FZF_DEFAULT_OPTS="
    --history=$HOME/.local/share/fzf/history
    --bind 'alt-i:up'
    --bind 'alt-k:down'
    --bind 'alt-u:backward-word'
    --bind 'alt-o:forward-word'
    --bind 'alt-e:backward-kill-word'
    --bind 'alt-r:kill-word'
    --bind 'alt-d:backward-delete-char'
    --bind 'alt-f:delete-char'
    --bind 'alt-j:backward-char'
    --bind 'alt-l:forward-char'
    --bind 'ctrl-s:toggle-sort'
    --bind 'alt-u:preview-page-up'
    --bind 'alt-d:preview-page-down'
    --bind 'ctrl-space:jump'"

