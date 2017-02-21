[ ! -f ~/.fzf.bash -a -f ~/.fzf/install ] && ~/.fzf/install

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_OPTS="
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
    --bind 'ctrl-u:preview-page-up'
    --bind 'ctrl-d:preview-page-down'"
