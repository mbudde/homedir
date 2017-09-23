setlocal foldmethod=indent

iab <buffer> ddd use Mojo::Util; say STDERR Mojo::Util::dumper
iab <buffer> yyy use YAML; say STDERR YAML::Dump
iab <buffer> ddD say STDERR Data::Dumper::Dumper
iab <buffer> sss say STDERR

vnoremap <buffer> <Leader>pt :!perltidy<CR>
nnoremap <buffer> <Leader>pt :%!perltidy<CR>
nnoremap <buffer> gp :call ft#perl#PerlOpenModuleUnderCursor()<CR>
vnoremap <buffer> <Leader>pg xi<%= __('<C-r>"') %><Esc>
nnoremap <buffer> <Leader>pg ^v$hxa%= __('<C-r>"')<Esc>
nnoremap <buffer> Ø :call ft#perl#PerlSubs()<CR>

inoremap <buffer> <expr> <C-l> fzf#complete({ 'source': 'perlmods', 'options': '-i' })

" Custom surround -
let b:surround_45 = "<% \r %>"
" Custom surround =
let b:surround_61 = "<%= \r %>"

" Neoterm REPL support
call neoterm#repl#set('re.pl')
