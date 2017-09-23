function! ft#perl#PerlOpen(mod)
    let path = system('perlopen -f ' . a:mod)
    if !v:shell_error
        execute 'e' path
    endif
endfunction

" PerlSubs {{{

function! s:perl_buffer_sub_handler(lines)
    let sub_line = matchstr(a:lines, "[0-9]\\+")
    let cur_line = prevnonblank(sub_line - 1)
    let header_line = 0
    if getline(cur_line) =~# '^=cut'
        let end_line = max([1, cur_line - (line('w$') - line('w0'))/2])
        while cur_line >= end_line
            if getline(cur_line) =~# '^=head'
                let header_line = cur_line
                break
            endif
            let cur_line -= 1
        endwhile
    endif
    if header_line > 0
        normal! m`
        execute header_line
        normal! zt
        execute sub_line
        normal! ^
    else
        normal! m`
        execute sub_line
        normal! ^zt
    endif
endfunction

function! s:perl_buffer_subs()
    let color = '38;5;' . synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'cterm')
    return map(filter(map(getline(1, "$"),
                \ 'printf(" \x1b[%sm%4d\x1b[m \t%s", color, v:key + 1, v:val)'),
                \ 'v:val =~ "\\t\\s*\\(\\*\\s*[A-Za-z_]\\+\\s*=[^>]\\|sub\\s\\+[A-Za-z_]\\)"'),
                \ 'substitute(v:val, "sub\\s\\+\\(.*\\)\\s*{.*$", "\\1", "")')
endfunction

function! ft#perl#PerlSubs()
    call fzf#run({
                \ 'source':  s:perl_buffer_subs(),
                \ 'sink': function('s:perl_buffer_sub_handler'),
                \ 'options': '+m --tiebreak=index --prompt "Subs> " --ansi --reverse --extended --nth=2.. --tabstop=1',
                \ 'left': '20%'
                \ })
endfunction

" }}}

function! ft#perl#PerlOpenModuleUnderCursor()
    let oldiskeyword = &iskeyword
    try
        setl iskeyword=@,48-57,_,:
        let currentIdent = substitute(expand('<cword>'), "\\C::\\([a-z_][^:]*\\|[A-Z_][A-Z_]\\+\\)$", "", "")
        " let currentIdent = substitute(expand('<cword>'), "C::DEFAULT", "", "")
        echo currentIdent
    finally
        let &iskeyword = oldiskeyword
    endtry
    call ft#perl#PerlOpen(currentIdent)
endfunction
