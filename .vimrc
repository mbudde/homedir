" vimrc file for Michael Budde <mbudde@gmail.com>
"

" General settings {{{1

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype plugin indent on

let mapleader = ','

set noautoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup
set diffopt+=vertical
set expandtab
set foldcolumn=0
set foldmethod=syntax
set formatoptions+=l " Don't break long lines when entering insert mode
set guifont=Monospace\ 9
set history=30
set ignorecase smartcase
set incsearch
set nojoinspaces
set laststatus=2
set linebreak
set listchars=tab:→\ ,eol:¬,trail:·,extends:⇒
set mouse=a          " In many terminal emulators the mouse works just fine, thus enable it.
set number
set ruler
set scrolloff=5
set shiftwidth=4
set showbreak=»\ 
set showcmd
set nosmartindent
set statusline=[%n]\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set tabstop=4
set tags+=~/.vim/tags
set nowrap
" :sort /set \(no\)\?/


let NERDShutUp=1     " Make NERDCommenter shut up.

let g:tags_dirs = '.'
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_WinWidth = 50

let g:netrw_hide = 1
let g:netrw_list_hide = "\.pyc$,\.swp$,^\\..*/$,\.a$,\.o$,\.so$"

if has("gui_running")
    set guioptions-=T
    set guioptions+=c
    command! NoMenu set guioptions-=m
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

if has("gui_running")
    colorscheme tango
else
    set t_Co=16
    colorscheme wombat
endif

" }}}1

" File type specific settings {{{1

" General settings {{{2

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

autocmd BufRead,BufNewFile wscript* set filetype=python
autocmd BufRead,BufNewFile .vimrc set foldmethod=marker
autocmd BufRead,BufNewFile *.mac set filetype=maxima
autocmd BufRead,BufNewFile *.pde set filetype=java

" Show trailing whitespace and spaces before tabs
"highlight link TrailingWhitespace Error
autocmd Syntax * syn match TrailingWhitespace /\(\zs\%#\|\s\)\+$/ display
autocmd Syntax * syn match TrailingWhitespace / \+\ze\t/ display


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" }}}2

" Python settings {{{2

autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal foldmethod=indent
autocmd Syntax python syn keyword pythonSelf self

let python_highlight_numbers = 1
"let python_highlight_builtins = 1
"let python_highlight_exceptions = 1

" }}}2

" LaTeX-Suite settings {{{2

autocmd FileType tex call <SID>TexFileSettings()
function! s:TexFileSettings()
    imap <S-F4> binom<F7>
    nmap <F11> :!asy %
endfunction

let g:Tex_ViewRule_pdf="evince"
let g:Tex_Com_tfrac = "\\tfrac{<++>}{<++>}<++>"
let g:Tex_Com_ssqrt = "\\sqrt[<++>]{<++>}<++>"
let g:Tex_Com_SI = "\\SI{<++>}{<++>}<++>"
let g:Tex_Com_num = "\\number{<++>}<++>"
let g:Tex_Com_binom = "\\binom{<++>}{<++>}<++>"
let g:Tex_Com_nfrac = "\\nicefrac{<++>}{<++>}<++>"
let g:Tex_HotKeyMappings = "align*,aligned,equation*"

" }}}2

" {{{2 Go

autocmd BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal noexpandtab
let go_highlight_trailing_whitespace_error = 0

" }}}2

" }}}1

" Mappings {{{1

map <expr> <F4> ':!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS ' . g:tags_dirs . '<CR>'
map <silent> <F8> :TlistToggle<CR>
nmap <F9> :e %:h<CR>
nmap <S-F9> :15split +:e\ %:h<CR>
nmap <F10> :cd %:h<CR>
nmap <silent> <F12>
    \ :if filereadable("./waf") <Bar>
    \   !./waf<CR> <Bar>
    \ else <Bar>
    \   !waf<CR> <Bar>
    \ endif<CR>
nmap <S-F12> :!./waf 

" maps for options
nmap <Leader>ow :set wrap!<CR>
nmap <Leader>oh :set hlsearch!<CR>
nmap <Leader>oi :set list!<CR>

" maps for buffers
nmap <Leader>l :ls<CR>
nmap <Leader>f :bn<CR>
nmap <Leader>d :bp<CR>
nmap <Leader>g :b#<CR>
nmap <Leader>r :bd<CR>

" maps for moving through tabs
nmap <C-h> gT
nmap <C-l> gt
nmap <A-1> :tabn 1<CR>
nmap <A-2> :tabn 2<CR>
nmap <A-3> :tabn 3<CR>
nmap <A-4> :tabn 4<CR>
nmap <A-5> :tabn 5<CR>
nmap <A-6> :tabn 6<CR>
nmap <A-7> :tabn 7<CR>
nmap <A-8> :tabn 8<CR>
nmap <A-9> :tabn 9<CR>
"nmap <C-S-t> :tabnew<CR>

" Easy saving
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

"map j gj
"map k gk

" Copy from mark a to current line and go back to current line
nmap <C-y> "+y'a<C-o>

" Highlight long lines
nnoremap <silent> <Leader>ol
    \ :if exists('w:long_line_match') <Bar>
    \   silent! call matchdelete(w:long_line_match) <Bar>
    \   unlet w:long_line_match <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:long_line_match = matchadd('Error', '\%>'.&tw.'v.\+', -1) <Bar>
    \ else <Bar>
    \   let w:long_line_match = matchadd('Error', '\%>80v.\+', -1) <Bar>
    \ endif<CR>

" }}}1

" Abbrivations {{{1

iab py#! #!/usr/bin/env python
iab sh#! #!/bin/sh
iab bash#! #!/bin/bash

" }}}1

" Miscellaneous {{{1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	"\ | wincmd p | diffthis


" }}}1

