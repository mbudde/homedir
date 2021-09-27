if exists("b:did_ftplugin") && b:did_ftplugin != 1
    finish
endif
"let b:did_ftplugin = 2

let g:beancount_separator_col = 74

setl foldmethod=marker foldenable

inoremap <buffer> . .<C-\><C-O>:AlignCommodity<CR>
nnoremap <buffer> <leader>= :AlignCommodity<CR>
vnoremap <buffer> <leader>= :AlignCommodity<CR>

"function! s:insert_transaction(result)
"    let insert_lnr = line('.')
"    let insert_parts = split(getline(insert_lnr), ' ')
"    let date = strftime("%Y-%m-%d")
"    if len(insert_parts) > 0
"        let date = date[:-len(insert_parts[0])-1] . insert_parts[0]
"    endif
"
"    let parts = split(a:result, ' ', 1)
"    if parts[0] ==# '-1'
"        let parts[1] = date
"        call setline(insert_lnr, join(parts[1:], ' '))
"    else
"        let copy_start = parts[0]
"        call cursor(copy_start, 0)
"        let copy_end = search('^$') - 1
"        let lines = getline(copy_start, copy_end)
"        let first_line = substitute(lines[0], '^[^ ]\+', date, "")
"        call cursor(insert_lnr, 0)
"        call setline(insert_lnr, first_line)
"        call append(insert_lnr, lines[1:] + [""])
"    end
"    normal f"l
"endfunction
"
"function! s:transaction_lines()
"    let lines = getline(1, '$')
"    let linefmt = "%d %s"
"    let fmtexpr = 'printf(linefmt, v:key + 1, v:val)'
"    let query = '^\d\{4\}-\d\{2\}-\d\{2\}\s\+\*'
"    let lines = map(lines, 'v:val =~ query ? '.fmtexpr.' : ""')
"    let lines = reverse(filter(lines, 'len(v:val)'))
"    call insert(lines, '-1 ' . strftime("%Y-%m-%d") . ' * ""')
"    return lines
"endfunction
"
"command! -nargs=0 CopyTransaction call fzf#run({
"            \ 'source': s:transaction_lines(),
"            \ 'sink': function("s:insert_transaction"),
"            \ 'options': ['--no-multi', '--with-nth=2..'],
"            \ 'down': '30%',
"            \ })
"
"inoremap <buffer> <C-t> <C-\><C-O>:CopyTransaction<CR>
"nnoremap <buffer> <C-t> :CopyTransaction<CR>
