" vimrc file for Michael Budde <mbudde@gmail.com>
"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Mappings
let mapleader = ','

"nmap <F9> :make
nmap <F10> :cd %:h<cr>
nmap <F11> :!asy %
nmap <F12> :!./waf<cr>
nmap <S-F12> :!./waf 

nmap <Leader>w :set wrap!<cr>
nmap <Leader>h :set hlsearch!<cr>
nmap <Leader>l :set list!<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    let python_highlight_space_errors = 1
    syntax on
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    autocmd FileType python setlocal textwidth=78

    " Show trailing whitespace and spaces before tabs
    highlight link TrailingWhitespace Error
    autocmd Syntax * syn match TrailingWhitespace /\(\zs\%#\|\s\)\+$/ display
    autocmd Syntax * syn match TrailingWhitespace / \+\ze\t/ display

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    augroup END

endif


if has("gui_running")
    colorscheme wombat
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set history=50
set ruler
set showcmd
set incsearch

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
"set shiftround

" Indent settings
set noautoindent
set smartindent

" Don't break long lines when entering insert mode
set formatoptions+=l

set ignorecase smartcase

"set linebreak
set showbreak=»\ 
set nowrap

set listchars=tab:→\ ,eol:¬,trail:·,extends:⇒

set foldmethod=syntax
set foldcolumn=0

set guifont=Monospace\ 9

"map j gj
"map k gk
set scrolloff=5

let NERDShutUp=1


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	"\ | wincmd p | diffthis

command! NoMenu set guioptions-=T | set guioptions-=m

" LaTeX-Suite settings:
let g:Tex_ViewRule_pdf="evince"
let g:Tex_Com_tfrac = "\\tfrac{<++>}{<++>}<++>"
let g:Tex_Com_ssqrt = "\\sqrt[<++>]{<++>}<++>"
let g:Tex_Com_SI = "\\SI{<++>}{<++>}<++>"
let g:Tex_Com_num = "\\number{<++>}<++>"
let g:Tex_Com_binom = "\\binom{<++>}{<++>}<++>"
let g:Tex_Com_nfrac = "\\nicefrac{<++>}{<++>}<++>"
let g:Tex_HotKeyMappings = "align*,aligned,equation*"
imap <S-F4> binom<F7>
