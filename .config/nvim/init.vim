
" syntax on
" filetype plugin indent on

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
"Plug 'KurtPreston/JavaScript-Indent'
Plug 'mbudde/mojo.vim', { 'branch': 'syntax-brackets' } " Plug 'yko/mojo.vim'
Plug 'neomake/neomake'
Plug 'qpkorr/vim-bufkill'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-perl/vim-perl', { 'branch': 'dev' }
Plug 'othree/html5.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'ledger/vim-ledger'
Plug 'posva/vim-vue'
Plug 'sjl/gundo.vim'

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
set splitright
set showcmd
set lazyredraw
set mouse=a
set guicursor=n-v-c:block-Cursor-blinkon0,i-ci:ver25-Cursor,r-cr:hor20-Cursor

set nofoldenable
set foldcolumn=0
set foldmethod=syntax
set foldnestmax=1

set signcolumn=yes

" Functionality
set ignorecase smartcase
set nojoinspaces
set wildignorecase
set wildmode=longest:full,full
set nowrap
set formatoptions+=n " Format numbered lists
set inccommand=nosplit
set nostartofline

let g:terminal_scrollback_buffer_size = 5000

" Syntax highlight subroutine signatures
let g:perl_sub_signatures = 1

call neomake#quickfix#enable()

" }}}

" Colorscheme {{{

set t_Co=256
set termguicolors
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

function! s:SetupTerm()
    nnoremap <buffer> gf :e <cfile><CR>
    nnoremap <buffer> q aq
    nnoremap <buffer> Q q
    nnoremap <buffer> <Enter> a<CR>
    setlocal errorformat+=%f:%l:%m,%f:%m,%f
    setlocal errorformat+=%f:%m
    setlocal errorformat+=%f
    setlocal signcolumn=no
endfunction
autocmd TermOpen * call s:SetupTerm()

" scrolloff is a global setting :(
autocmd BufEnter * set scrolloff=5
autocmd BufEnter term://* set scrolloff=0

" Esc is mapped to "exit terminal mode" but fzf terminals I want Esc to exit fzf
autocmd TermOpen *bin/fzf* tnoremap <buffer> <Esc> <Esc>

" Fugitive commands in terminal
" https://github.com/tpope/vim-fugitive/pull/652#issuecomment-245124604
autocmd TermOpen * call fugitive#detect(getcwd())

autocmd BufWritePost *.{sh,pl} silent exe "!chmod +x %"

augroup END

" }}}

" Abbrivations {{{

iab py#! #!/usr/bin/env python
iab sh#! #!/bin/sh
iab bash#! #!/bin/bash

" Current file directory expansion
cabbr <expr> %% expand('%:p:h')

" }}}

" Commands {{{

fun! Mkdirs(path)
    let path = strlen(a:path) ? a:path : expand("%:p:h")
    execute "!mkdir -p " . shellescape(path)
endfun
command! -nargs=? Mkdirs call Mkdirs(<q-args>)

function! SplitLine()
    let lnum = line('.')
    let currentline = getline(lnum)
    let space = repeat(' ', indent(lnum))
    let parts = split(currentline, ',\s*')
    let first = remove(parts, 0)
    call setline(lnum, first . ",")
    for part in parts
        call append(lnum, space . part . ",")
        let lnum = lnum + 1
    endfor
    let c = col([lnum, '$'])
    call cursor(lnum, c)
endfunction
command! SplitLine call SplitLine()

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
nmap <Leader>w :w<CR>:BD<CR>
nmap <Leader>x :BD<CR>

" Set visual selection to search pattern
vnoremap <Leader>v y:setl hlsearch<CR>:let @/="\\<".@"."\\>"<CR>
nmap <Leader>v :setl hlsearch<CR>:let @/="\\<".expand("<cword>")."\\>"<CR>
vnoremap <Leader>V y:setl hlsearch<CR>:let @/=@"<CR>
nmap <Leader>V :setl hlsearch<CR>:let @/=expand("<cword>")<CR>

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
nnoremap <silent> <A-j> :<C-u>execute 'move +' . v:count1<CR>==
nnoremap <silent> <A-k> :<C-u>execute 'move -1-' . v:count1<CR>==
inoremap <A-j> <Esc>:m+<CR>gi
inoremap <A-k> <Esc>:m-2<CR>gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Swap text (http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines)
vnoremap <C-X> <Esc>`.``gvP``P

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <S-Esc> <Esc>

" Surround rest of paragraph with braces
imap <C-B> <Esc>jV}geS}kJ

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

nnoremap æ :RGFiles<CR>
nmap ø :RGFiles -- %%<CR>
nnoremap å :Buffers<CR>
nnoremap Æ :RGAllFiles<CR>
nnoremap Å :BLines<CR>
nnoremap <Leader>gt :Tags<CR>
nnoremap <Leader>oj :JSFiles<CR>
nnoremap <Leader>op :PFiles<CR>

command! -nargs=0 Todo Rg (TODO|FIXME|XXX)\(mbu\)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.join(map([<f-args>], 'shellescape(v:val)'), ' '), 1,
  \   <bang>0 ? fzf#vim#with_preview({ 'options': '--reverse' }, 'up:60%')
  \           : fzf#vim#with_preview({ 'options': '--reverse' }, 'right:50%:hidden', '?'),
  \   <bang>0)

function! s:rgfiles(cmd, args)
    let rgargs = []
    let dir = ''
    let next_is_dir = 0
    for arg in a:args
        if next_is_dir
            let dir = arg
            break
        endif
        if arg ==# '--'
            let next_is_dir = 1
        endif
        call add(rgargs, shellescape(arg))
    endfor
    call fzf#vim#files(dir, {
        \ 'source': a:cmd . ' ' . join(rgargs, ' '),
        \ })
endfunction


command! -nargs=* -complete=dir RGFiles call s:rgfiles('rg --files --color=never', [<f-args>])
command! -nargs=* -complete=dir RGAllFiles call s:rgfiles('rg --files --no-ignore --color=never', [<f-args>])
command! -nargs=* -complete=dir PFiles call s:rgfiles('rg --type-add "mojo:*.ep" --type perl --type mojo --files --color=never', [<f-args>])
command! -nargs=* -complete=dir JSFiles call s:rgfiles('rg --type js --files --color=never', [<f-args>])

command! -nargs=0 PerlOpen call fzf#run({
            \ 'source': 'perlmods',
            \ 'sink': function('ft#perl#PerlOpen')
            \ })

" }}}

" }}}

" NERD commenter {{{
let NERDShutUp=1
let NERDSpaceDelims=1

let g:NERDCustomDelimiters = {
    \ 'html.epl': { 'left': '%#' },
\ }

" }}}

" Multiple cursors {{{
let g:multi_cursor_exit_from_insert_mode = 0
" }}}

" vim-test {{{
let test#strategy = "neoterm"

nnoremap <silent> <Leader>TT :TestLast<CR>
nnoremap <silent> <leader>Ts :TestSuite<CR>
nnoremap <silent> <leader>Tf :TestFile<CR>
nnoremap <silent> <leader>TF :TestFile -v<CR>
nnoremap <silent> <leader>Tn :TestNearest<CR>
nnoremap <silent> <leader>TN :TestNearest -v<CR>
nnoremap <silent> <leader>Tv :TestVisit<CR>

" }}}

" Neoterm {{{

let g:neoterm_default_mod = ':vertical'

nnoremap <silent> <Leader>to :Topen<cr>
nnoremap <silent> <Leader>tO :exe 'b '.g:neoterm.last().buffer_id<cr>
nnoremap <silent> <Leader>tn :Tnew<cr>
" hide/close terminal
nnoremap <silent> <Leader>th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <Leader>tl :call neoterm#clear()<cr>
" kills the current job (send a ^C)
nnoremap <silent> <Leader>tc :call neoterm#kill()<cr>

nnoremap <silent> <Leader>ts :TREPLSendLine<cr>
vnoremap <silent> <Leader>ts :TREPLSendLine<cr>
nnoremap <silent> <Leader>tf :TREPLSendFile<cr>

" }}}

" Airline {{{

let g:airline_theme = 'bubblegum'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" }}}

" Fugitive {{{

nnoremap <Leader>Ge :Gedit<CR>
nnoremap <Leader>Gd :Gdiff<CR>
nnoremap <Leader>Gs :Gstatus<CR>
nnoremap <Leader>Gw :Gwrite<CR>
nnoremap <Leader>Gb :Gblame<CR>
nnoremap <Leader>Gl :Glog --reverse origin/master.. --<CR>

function! GlogLines(args)
    let [firstline, lastline] = sort([line("'<"), line("'>")], 'n')
    execute "Glog -L" . l:firstline . "," . l:lastline . ":" . expand('%') . " " . a:args
endfunction

vnoremap <silent> <Leader>Gb :<C-u>call GlogLines("")<CR>
vnoremap <silent> <Leader>GB :<C-u>call GlogLines("--")<CR>

" }}}

" }}}

" File-specific settings and mappings {{{

" }}}
