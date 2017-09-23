function! s:rust_buffer_func_handler(lines)
    let sub_line = matchstr(a:lines, "[0-9]\\+")
    let cur_line = prevnonblank(sub_line - 1)
    normal! m`
    execute sub_line
    normal! ^zt
endfunction

function! s:rust_buffer_funcs()
    let color = '38;5;' . synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'cterm')
    let func = '38;5;' . synIDattr(synIDtrans(hlID('Function')), 'fg', 'cterm')
    return map(filter(map(getline(1, "$"),
                \ 'printf(" \x1b[%sm%4d\x1b[m \t%s", color, v:key + 1, v:val)'),
                \ 'v:val =~ "\\v<fn\\s+(_\\w|[A-Za-z])\\w*"'),
                \ 'substitute(v:val, "\\v%(\\s*pub)?\\s*fn\\s+(%(_\\w|[A-Za-z])\\w*)([^{]{-})\\s*\\{?$", " \x1b['.func.'m\\1\x1b[m\\2", "")')
endfunction

function! ft#rust#RustFuncs()
    call fzf#run({
                \ 'source':  s:rust_buffer_funcs(),
                \ 'sink': function('s:rust_buffer_func_handler'),
                \ 'options': '+m --tiebreak=index --prompt "Funcs> " --ansi --reverse --extended --nth=2.. --tabstop=1',
                \ 'left': '30%'
                \ })
endfunction
