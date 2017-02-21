
syntax on
filetype plugin indent on

call plug#begin('~/.config/nvim/bundle')

Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm'
Plug 'KurtPreston/JavaScript-Indent'
Plug 'mbudde/mojo.vim', { 'branch': 'syntax-brackets' } " Plug 'yko/mojo.vim'
Plug 'neomake/neomake'
Plug 'qpkorr/vim-bufkill'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-perl/vim-perl'
Plug 'othree/html5.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'

call plug#end()

let mapleader = ','

" Settings {{{

" Tab/space
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" UI
set hidden
set fillchars=
set number
set relativenumber
set ruler
set scrolloff=5
set splitright
set showcmd
set lazyredraw
set mouse=a

set nofoldenable
set foldcolumn=0
set foldmethod=syntax
set foldnestmax=1

" Functionality
set ignorecase smartcase
set nojoinspaces
set wildignorecase
set wildmode=longest:full,full
set nowrap
set formatoptions+=n " Format numbered lists

let g:terminal_scrollback_buffer_size = 5000

" }}}

" Colorscheme {{{

set t_Co=256
colorscheme wombat

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}

" Autocommands {{{

" Remove all autocommands in the default group
augroup mbudde
autocmd!

"autocmd! BufWritePost ~/.config/nvim/init.vim source %

autocmd FileType text setlocal textwidth=78
autocmd BufRead,BufNewFile ~/.config/nvim/init.vim setlocal foldmethod=marker
autocmd BufRead,BufNewFile *.mac setlocal filetype=maxima
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile *.rs setlocal filetype=rust
autocmd BufRead,BufNewFile *.tikz setlocal filetype=tex
autocmd BufRead,BufNewFile *.html*.ep setlocal filetype=html.epl
autocmd BufRead,BufNewFile *.txt*.ep setlocal filetype=text.epl

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

autocmd TermOpen * nnoremap <buffer> gf :e <cfile><CR>
autocmd TermOpen * nnoremap <buffer> q aq
autocmd TermOpen * nnoremap <buffer> Q q
autocmd TermOpen * setlocal errorformat+=%f:%l:%m,%f:%m,%f
autocmd TermOpen * setlocal errorformat+=%f:%m
autocmd TermOpen * setlocal errorformat+=%f

" Esc is mapped to "exit terminal mode" but fzf terminals I want Esc to exit fzf
autocmd TermOpen *bin/fzf* tnoremap <buffer> <Esc> <Esc>

autocmd BufWritePost *.{sh,pl} silent exe "!chmod +x %"

" Neoterm REPL support
autocmd FileType perl call neoterm#repl#set('re.pl')

augroup END

" }}}

" Abbrivations {{{

iab py#! #!/usr/bin/env python
iab sh#! #!/bin/sh
iab bash#! #!/bin/bash
iab ddd use Mojo::Util; say STDERR Mojo::Util::dumper
iab ddD say STDERR Data::Dumper::Dumper
iab sss say STDERR

" Current file directory expansion
cabbr <expr> %% expand('%:p:h')

" }}}

" Commands {{{

fun! Mkdirs(path)
    let path = strlen(a:path) ? a:path : expand("%:p:h")
    execute "!mkdir -p " . shellescape(path)
endfun
command! -nargs=? Mkdirs call Mkdirs(<q-args>)

" }}}

" Mappings {{{

" Function keys
nnoremap <F2> :mksession! ~/.local/share/nvim/saved-session.vim<CR>
nnoremap <F3> :source ~/.local/share/nvim/saved-session.vim<CR>
nnoremap <F7> :%s/\s\+$//e<CR>``

" maps for buffers
nmap <Leader>f :bn<CR>
nmap <Leader>d :bp<CR>
nmap <Leader>e :b #<CR>
nmap <Leader>q :bd<CR>
nmap <Leader>Q :bd!<CR>
nmap <Leader>w :w<CR>:bd<CR>
nmap <Leader>W :w<CR>:BD<CR>
nmap <Leader>x :BD<CR>

" Set visual selection to search pattern
vnoremap <Leader>v y:setl hlsearch<CR>:let @/="\\<".@"."\\>"<CR>
nmap <Leader>v viw<Leader>v
vnoremap <Leader>V y:setl hlsearch<CR>:let @/=@"<CR>
nmap <Leader>V viw<Leader>V

" maps for moving through tabs
nmap <Leader>D gT
nmap <Leader>F gt
nmap <M-h> gT
nmap <M-l> gt

" Don't use Ex mode, use Q for formatting
map Q gq

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k


imap kj <Esc>

" Yank filename under cursor
nmap <expr> <silent> yf ':let @'.v:register.' = expand("<cfile>")<CR>'
" Put filename of current buffer in a register
nmap <expr> <silent> yF ':let @'.v:register.' = expand("%")<CR>'
" Edit filename in register
nmap <expr> <silent> <leader>gr ':e '.getreg(v:register).'<CR>'

" Escape in normal mode clears search highlighting
nnoremap <silent> <Esc> <Esc>:noh<CR>

" Easy saving
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

" Line swapping (http://vim.wikia.com/wiki/Moving_lines_up_or_down)
nnoremap <A-j> :<C-u>execute 'move +' . v:count1<CR>
nnoremap <A-k> :<C-u>execute 'move -1-' . v:count1<CR>
inoremap <A-j> <Esc>:m+<CR>gi
inoremap <A-k> <Esc>:m-2<CR>gi
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv

" Swap text (http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines)
vnoremap <C-X> <Esc>`.``gvP``P

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <S-Esc> <Esc>

" }}}

" Plugin-specific settings and mappings {{{

" EasyMotion {{{

"let g:sneak#streak = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'

"nmap <Space> <Plug>(easymotion-prefix)
"nmap <Tab> <Plug>Sneak_S
nmap <silent> <expr> <Space> sneak#is_sneaking()
              \ ? (sneak#state().rptreverse ? '<Plug>(SneakStreakBackward)<cr>' : '<Plug>(SneakStreak)<cr>')
              \ : '<Plug>Sneak_s'

nmap <Leader><Space> <Plug>Sneak_S

" }}}

" Easy Align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" FZF {{{
if system('git --version') =~ ' 1\.\([0-7]\|8\.[0-2]\)\.'
    " %C(auto) feature was introduced in 1.8.3
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(yellow)%h%C(reset)%d %s %C(black)%C(bold)%cr%C(reset)"'
endif

nnoremap æ :Files<CR>
nmap ø :Files %%<CR>
nnoremap å :Buffers<CR>
nnoremap Æ :Lines<CR>
nnoremap Ø :call PerlSubs()<CR>
nnoremap Å :BLines<CR>
nnoremap <Leader>gt :Tags<CR>

command! -nargs=0 Todo Rg (TODO|FIXME|XXX)\(mbu\)

inoremap <expr> <C-l> fzf#complete('perlmods')

function! PerlOpen(mod)
    let path = system('perlopen -f ' . a:mod)
    execute 'e' path
endfunction

command! -nargs=0 PerlOpen call fzf#run({
            \ 'source': 'perlmods',
            \ 'sink': function('PerlOpen')
            \ })

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

function! PerlSubs()
    call fzf#run({
                \ 'source':  s:perl_buffer_subs(),
                \ 'sink': function('s:perl_buffer_sub_handler'),
                \ 'options': '+m --tiebreak=index --prompt "Subs> " --ansi --reverse --extended --nth=2.. --tabstop=1',
                \ 'left': '20%'
                \ })
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.join(map([<f-args>], 'shellescape(v:val)'), ' '), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" }}}

" }}}

" NERD commenter {{{
let NERDShutUp=1
let NERDSpaceDelims=1

let g:NERDCustomDelimiters = {
    \ 'html.epl': { 'left': '%#' },
\ }

" }}}

" Git Gutter {{{
let g:gitgutter_sign_column_always = 1
" }}}

" Multiple cursors {{{
let g:multi_cursor_exit_from_insert_mode = 0
" }}}

" vim-test {{{
let test#strategy = "neoterm"

nnoremap <silent> <Leader>tt :TestLast<CR>

" }}}

" Neoterm {{{

let g:neoterm_position = 'vertical'

nnoremap <silent> <Leader>to :Topen<cr>
nnoremap <silent> <Leader>tO :exe 'b '.g:neoterm.last().buffer_id<cr>
nnoremap <silent> <Leader>tn :Tnew<cr>
" hide/close terminal
nnoremap <silent> <Leader>th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <Leader>tl :call neoterm#clear()<cr>
" kills the current job (send a ^C)
nnoremap <silent> <Leader>tc :call neoterm#kill()<cr>

nnoremap <silent> <Leader>ts :TREPLSend<cr>
vnoremap <silent> <Leader>ts :TREPLSend<cr>
nnoremap <silent> <Leader>tf :TREPLSendFile<cr>

" }}}

" Airline {{{

let g:airline_theme = 'luna'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" }}}

" }}}

" File-specific settings and mappings {{{

" Perl {{{

function! PerlOpenModuleUnderCursor()
    let oldiskeyword = &iskeyword
    try
        setl iskeyword=@,48-57,_,:
        let currentIdent = expand('<cword>')
    finally
        let &iskeyword = oldiskeyword
    endtry
    call PerlOpen(currentIdent)
endfunction

" Syntax highlight subroutine signatures
let perl_sub_signatures = 1

augroup mbudde_perl
autocmd!

autocmd FileType perl setlocal foldmethod=indent

autocmd FileType perl,html.epl vnoremap <buffer> <Leader>pt :!perltidy<CR>
autocmd FileType perl nnoremap <buffer> <Leader>pt :%!perltidy<CR>
autocmd FileType perl,html.epl nnoremap <buffer> gp :call PerlOpenModuleUnderCursor()<CR>
autocmd FileType *.epl let b:surround_45 = "<% \r %>"
autocmd FileType *.epl let b:surround_61 = "<%= \r %>"


autocmd FileType html.epl vnoremap <buffer> <Leader>pg xi<%= __('<C-r>"') %><Esc>
autocmd FileType html.epl nnoremap <buffer> <Leader>pg ^v$hxa%= __('<C-r>"')<Esc>

augroup END

" }}}

" }}}
