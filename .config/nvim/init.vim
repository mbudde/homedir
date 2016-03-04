
call plug#begin('~/.config/nvim/bundle')

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdcommenter'

Plug 'guns/xterm-color-table.vim'

"Plug 'nanotech/jellybeans.vim'

Plug 'vim-perl/vim-perl'
Plug 'rust-lang/rust.vim'

call plug#end()

let mapleader = ','

" Settings {{{

" Tab/space
set expandtab
set tabstop=4
set shiftwidth=4

" UI
set hidden
set fillchars=
set number
set relativenumber
set ruler
set scrolloff=5

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

" }}}

" Colorscheme {{{

" let g:jellybeans_overrides = {
" \    'VertSplit': { '256ctermbg': '235' },
" \}
set t_Co=256
colorscheme wombat

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}

" Autocommands {{{

autocmd! BufWritePost ~/.config/nvim/init.vim source %

autocmd FileType text setlocal textwidth=78
autocmd BufRead,BufNewFile ~/.config/nvim/init.vim setlocal foldmethod=marker
autocmd BufRead,BufNewFile *.mac setlocal filetype=maxima
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile *.rs setlocal filetype=rust
autocmd BufRead,BufNewFile *.tikz setlocal filetype=tex
autocmd BufRead,BufNewFile *.html*.ep setlocal filetype=html.epl
autocmd BufRead,BufNewFile sqlreport.txt setlocal filetype=jixsqlreport autoread

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" }}}

" Mappings {{{

" maps for buffers
nmap <Leader>f :bn<CR>
nmap <Leader>d :bp<CR>
nmap <Leader>e :b #<CR>
nmap <Leader>q :bd<CR>
nmap <Leader>Q :bd!<CR>
nmap <Leader>w :w<CR>:bd<CR>
nmap <Leader>W :w<CR>:bd<CR>
nmap <Leader>x :BD<CR>

" maps for moving through tabs
nmap <Leader>D gT
nmap <Leader>F gt

" Don't use Ex mode, use Q for formatting
map Q gq

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

imap kj <Esc>

inoremap <S-Enter> <C-O>O
inoremap <C-Enter> <C-O>o

" Current file directory expansion
cabbr <expr> %% expand('%:p:h')

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

" }}}

" Plugin-specific settings and mappings {{{

" Ctrl-P {{{
nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap æ :CtrlP<CR>
nmap ø :CtrlP %%<CR>
nnoremap å :CtrlPBuffer<CR>
" }}}

" NERD commenter {{{
let NERDShutUp=1
let NERDSpaceDelims=1
" }}}

" Git Gutter {{{
let g:gitgutter_sign_column_always = 1
" }}}

" }}}

" File-specific settings and mappings {{{

" Perl {{{

if filereadable(expand("~/Code/cloned/dev-utils/conf/vim/skeletons.vimrc"))
    source ~/Code/cloned/dev-utils/conf/vim/skeletons.vimrc
endif

autocmd FileType perl vmap <buffer> <Leader>pt :!perltidy<CR>
autocmd FileType perl nmap <buffer> <Leader>pt :%!perltidy<CR>
autocmd FileType perl nmap <buffer> <Leader>pi :silent !ssh gnu 'bash -l -c "jix-fix-explicit-inclusion jobxx/%"'<CR>:e!<CR>
autocmd FileType perl setlocal foldmethod=indent

vnoremap <Leader>tr xi<%= __('<C-r>"') %><Esc>
nnoremap <Leader>tr ^v$hxa%= __('<C-r>"')<Esc>


" }}}

" }}}
