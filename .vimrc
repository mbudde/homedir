" vimrc file for Michael Budde <mbudde@gmail.com>
"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'ciaranm/detectindent'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'frimik/vim-puppet'
"Plugin 'pangloss/vim-javascript'
Plugin 'sjl/gundo.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'chriskempson/base16-vim'
Plugin 'danro/rename.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'groenewege/vim-less'
Plugin 'yko/mojo.vim'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'moll/vim-bbye'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'KurtPreston/JavaScript-Indent'

Plugin 'Align'
Plugin 'bufkill.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'indentpython.vim'
Plugin 'keepcase.vim'
Plugin 'python.vim--Vasiliev'
Plugin 'ReplaceWithRegister'

call vundle#end()
filetype plugin indent on

" Go syntax and filetype plugins
set rtp+=$GOROOT/misc/vim

" General settings {{{1

let mapleader = ','

set noautoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup
set diffopt+=vertical
set expandtab
set nofoldenable
set foldcolumn=0
set foldmethod=syntax
set formatoptions+=l " Don't break long lines when entering insert mode
set guifont=Ubuntu\ Mono\ 11
set hidden
set history=30
set ignorecase smartcase
set incsearch
set nojoinspaces
set laststatus=2
set linebreak
set listchars=tab:→\ ,trail:·,extends:⇒
set mouse=a          " In many terminal emulators the mouse works just fine, thus enable it.
set number
set relativenumber
set ruler
set scrolloff=5
set shiftwidth=4
set showbreak=»\ 
set showcmd
set nosmartindent
set statusline=[%n]\ %<%f\ %h%m%r\ %{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set tabstop=4
set tags+=~/.vim/tags
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set nowrap
" :sort /set \(no\)\?/

let NERDShutUp=1     " Make NERDCommenter shut up.
let NERDSpaceDelims=1
let NERDTreeQuitOnOpen=1

let g:tags_dirs = '.'
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_WinWidth = 50

let g:netrw_hide = 1
let g:netrw_list_hide = "\.pyc$,\.swp$,^\\..*/$,\.a$,\.o$,\.so$"

let g:fontsize#timeoutlen = 5000

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

if has("gui_running")
    set guioptions-=T  " hide toolbar
    set guioptions+=c  " use console dialogs
    set guioptions-=l  " hide left scrollbar
    set guioptions-=L  " hide left scrollbar when vertically split
    set guioptions-=r  " hide right scrollbar
    set guioptions-=R  " hide right scrollbar when vertically split
    set guioptions-=m  " default to no menu
    command! Menu set guioptions+=m
    command! NoMenu set guioptions-=m

    " Maximize GUI on startup. GUIEnter auto command is executed after the GUI
    " has been successfully initialized. Depends on the wmctrl program which
    " is usually not installed by default.
    autocmd GUIEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

if has("gui_running")
    " colorscheme tango
    colorscheme solarized
    set background=dark
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
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.mdown set filetype=markdown
autocmd BufRead,BufNewFile *.tup set filetype=tup
autocmd BufRead,BufNewFile Tupfile set filetype=tup
autocmd BufRead,BufNewFile *.ja set filetype=janus
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd BufRead,BufNewFile *.tikz set filetype=tex

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

" Delete fugitive buffers when they are hidden.
autocmd BufReadPost fugitive://* set bufhidden=delete

" }}}2

" Python settings {{{2

autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal foldmethod=indent
autocmd Syntax python syn keyword pythonSelf self
autocmd FileType python iab <buffer> ifmain if __name__ == '__main__':

let python_highlight_numbers = 1
"let python_highlight_builtins = 1
"let python_highlight_exceptions = 1

" }}}2

" HTML/Javascript/CoffeeScript settings {{{2

autocmd FileType {html*,javascript,coffee,php} setlocal shiftwidth=2 tabstop=2

" }}}2

" Haskell settings {{{2
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2
" }}}2

" LaTeX-Suite settings {{{2

let g:tex_indent_brace = 0
autocmd FileType tex call <SID>TexFileSettings()
autocmd FileType bib nnoremap <buffer> <Leader>bo :call <SID>BibtexOpen()<CR>
autocmd FileType bib nnoremap <buffer> <Leader>bc :call <SID>BibtexCite()<CR>
autocmd FileType bib nnoremap <buffer> <Leader>bq ?@<CR>jV/^}<CR>k=gv:Align =<CR>gv:s/=/              =/<CR>gv:s/^\(.\{19\}\).*=/\1=/<CR>?@<CR>

function! s:TexFileSettings()
    imap <S-F4> binom<F7>
    nmap <F11> :!asy %
endfunction

function! s:BibtexOpen()
    let save_unnamed = @@

    exe "silent normal! ma?^@\<cr>k"
    let line = getline(".")
    if line[0] ==# "%"
        exe "silent ! gnome-open ~/Documents/Uni/MScThesis/" . line[2:] . " &"
    else
        echom "No filename found!"
    endif
    exe "silent normal! `a"

    let @@ = save_unnamed
endfunc

function! s:BibtexCite()
    " Yank citation key
    exe "silent normal! ma?^@\<cr>f{lyt,`a"
    let @@ = "\\cite{" . @@ . "}"
endfunc


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

" {{{2 Ledger

autocmd FileType ledger nmap <buffer> <Leader>m :call LedgerAmount(49, ',')<CR>
autocmd FileType ledger imap <buffer> <Leader>m <Esc>:call LedgerAmount(49, ',')<CR>
autocmd FileType ledger iab <buffer> AB Aktiver:Bankkonto

" }}}2

" Perl {{{

autocmd FileType perl vmap <buffer> <Leader>pt :!perltidy<CR>
autocmd FileType perl nmap <buffer> <Leader>pt :%!perltidy<CR>

vnoremap <Leader>tr xi<%= __('<C-r>"') %><Esc>
nnoremap <Leader>tr ^v$hxa%= __('<C-r>"')<Esc>


" }}}

" }}}1

" Project specific settings {{{1

" Colligo/Refero {{{2

autocmd BufRead /home/michael/Code/projects/viewworld/colligo/*/*.java setlocal noexpandtab

" }}}2

" YAML settings {{{2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" }}}2

" }}}1

" Mappings {{{1

nmap - :NERDTree<CR>

nnoremap <F2> :mksession! ~/.vim_session<CR>
nnoremap <F3> :source ~/.vim_session<CR>
map <expr> <F4> ':!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS ' . g:tags_dirs . '<CR>'
nnoremap <F5> :GundoToggle<CR>
nmap <F7> mp:%s/\s\+$//e<CR>`p
vmap <F7> :s/\s\+$//e<CR>
nnoremap <F8> :setl nocin nosi inde=<CR>
nmap <S-F9> :15split +:e\ %:h<CR>
nmap <F9> :cd %:h<CR>

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

imap kj <Esc>

" save with sudo
cmap w!! w !sudo tee >/dev/null %

" duplicate and comment
vmap D ygv<Leader>c<Space>P

" maps for buffers
nmap <Leader>l :ls<CR>
nmap <Leader>f :bn<CR>
nmap <Leader>d :bp<CR>
nmap <Leader>e :b #<CR>
nmap <Leader>q :bd<CR>
nmap <Leader>Q :bd!<CR>
nmap <Leader>w :w<CR>:bd<CR>
nmap <Leader>W :w<CR>:bd<CR>
nmap <Leader>x :Bdelete<CR>

" maps for moving through tabs
nmap <Leader>D gT
nmap <Leader>F gt
" nmap <A-1> :tabn 1<CR>
" nmap <A-2> :tabn 2<CR>
" nmap <A-3> :tabn 3<CR>
" nmap <A-4> :tabn 4<CR>
" nmap <A-5> :tabn 5<CR>
" nmap <A-6> :tabn 6<CR>
" nmap <A-7> :tabn 7<CR>
" nmap <A-8> :tabn 8<CR>
" nmap <A-9> :tabn 9<CR>
nmap <C-t> :tabnew<CR>

" Easy saving
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" map j gj
" map k gk

" Copy from mark a to current line and go back to current line
nmap <C-y> "+y'a<C-o>

" maps for options
nmap <Leader>ow :setlocal wrap!<CR>
nmap <Leader>oh :setlocal hlsearch!<CR>
nmap <Leader>oi :setlocal list!<CR>

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


" FuzzyFinder
let g:fuf_keyPreview = '<C-p>'
let g:fuf_buffer_keyDelete = '<C-d>'
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|pdf|fdb_latexmk|pyc)$|(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])'
nnoremap <silent> <Leader>sj     :FufBuffer<CR>
nnoremap <silent> <Leader>sl     :FufCoverageFile<CR>
nnoremap <silent> <Leader>sL     :FufCoverageFileRegister<CR>
nnoremap <silent> <Leader>sf     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <Leader>sF     :FufFile<CR>
nnoremap <silent> <Leader>sbd    :FufBookmarkDir<CR>
nnoremap <silent> <Leader>sBd    :FufBookmarkDirAdd<CR>
nnoremap <silent> <Leader>sbf    :FufBookmarkFile<CR>
nnoremap <silent> <Leader>sBf    :FufBookmarkFileAdd<CR>
nnoremap <silent> <Leader>sr     :FufRenewCache<CR>
nnoremap <silent> <Leader>si     :FufLine<CR>
nnoremap <silent> <Leader>sc     :FufChangeList<CR>

" Ctrl-P
let g:ctrlp_working_path_mode = 'a'

nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap æ :CtrlP<CR>
nmap ø :CtrlP %%<CR>
nnoremap å :CtrlPBuffer<CR>

" Line swapping (http://vim.wikia.com/wiki/Moving_lines_up_or_down)
nnoremap <A-j> :m+<CR>
nnoremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>gi
inoremap <A-k> <Esc>:m-2<CR>gi
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv

" }}}1

" Abbrivations {{{1

iab py#! #!/usr/bin/env python
iab sh#! #!/bin/sh
iab bash#! #!/bin/bash

" Current file directory expansion
cabbr <expr> %% expand('%:p:h')

" }}}1

" Miscellaneous {{{1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	"\ | wincmd p | diffthis


func! GotoCol(pos)
    exec "normal " . a:pos . "|"
    let diff = a:pos - virtcol('.')
    if diff > 0
        exec "normal " . diff . "a "
    endif
endfunc

func! LedgerAmount(col, sep)
    call inputsave()
    let amount = input("Amount: ")
    call inputrestore()
    if amount == ""
        return
    endif
    let seppos = match(amount, a:sep)
    call GotoCol(a:col - seppos - 1)
    call setline('.', getline('.') . amount)
endfunc

function! OpenAll(arg)
    let args=globpath(&path, a:arg)
    for temp_file in split(args, '\n')
        silent exec "e ".temp_file
    endfor
endfunction

com! -nargs=1 Eglob call OpenAll('<args>')

" }}}1

au! BufWritePost .vimrc source %

