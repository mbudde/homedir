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
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'frimik/vim-puppet'
"Plugin 'pangloss/vim-javascript'
Plugin 'sjl/gundo.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'chriskempson/base16-vim'
Plugin 'danro/rename.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'lervag/vimtex'
Plugin 'groenewege/vim-less'
Plugin 'yko/mojo.vim'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'moll/vim-bbye'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'KurtPreston/JavaScript-Indent'
Plugin 'junegunn/fzf.vim'

Plugin 'Align'
Plugin 'bufkill.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'indentpython.vim'
Plugin 'python.vim--Vasiliev'
Plugin 'ReplaceWithRegister'

call vundle#end()
filetype plugin indent on

runtime macros/matchit.vim


" Go syntax and filetype plugins
set rtp+=$GOROOT/misc/vim
set rtp+=~/.fzf

" General settings {{{1

let mapleader = ','

set noautoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup
set diffopt+=vertical
set expandtab
set nofoldenable
set fillchars=
set foldcolumn=0
set foldmethod=syntax
set foldnestmax=1
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

let g:solarized_underline=0

if has("gui_running")
    set guioptions-=T  " hide toolbar
    set guioptions+=c  " use console dialogs
    set guioptions-=l  " hide left scrollbar
    set guioptions-=L  " hide left scrollbar when vertically split
    set guioptions-=r  " hide right scrollbar
    set guioptions-=R  " hide right scrollbar when vertically split
    set guioptions-=m  " default to no menu
    set guioptions-=e  " disable GUI tabs in favor of text tabs
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

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}1

" File type specific settings {{{1

" General settings {{{2

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
autocmd BufRead,BufNewFile .vimrc set foldmethod=marker


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

" LaTeX/Vimtex settings {{{2

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

    exe "silent normal! maj?^@"
    exe "silent normal! /^\\s*\\(}\\|file\\)"
    let line = getline(".")
    if line =~ "\s*file"
        let filename = matchstr(line, "{\\zs.*\\ze}")
        if filename !=# ""
            echomsg "Opening " . filename
            exe "silent ! gnome-open ~/Documents/Uni/MScThesis/" . filename . " &"
        else
            echoerr "Empty filename"
        endif
    else
        echoerr "No filename found!"
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

let g:vimtex_complete_recursive_bib = 1
let g:vimtex_latexmk_build_dir = 'output'

" }}}2

" {{{2 Go

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

inoremap <S-Enter> <Esc>O

" save with sudo
cmap w!! w !sudo tee >/dev/null %

" duplicate and comment
vmap D ygv<Leader>c<Space>P

" maps for buffers
"nmap <Leader>l :ls<CR>
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
"nmap <C-y> "+y'a<C-o>

nnoremap <leader>m  :<C-u><C-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><Left>

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
let g:ctrlp_max_files = 30000

nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap æ :CtrlP<CR>
nmap ø :CtrlP %%<CR>
nnoremap å :CtrlPBuffer<CR>

" Line swapping (http://vim.wikia.com/wiki/Moving_lines_up_or_down)
nnoremap <A-j> :<C-u>execute 'move +' . v:count1<CR>
nnoremap <A-k> :<C-u>execute 'move -1-' . v:count1<CR>
inoremap <A-j> <Esc>:m+<CR>gi
inoremap <A-k> <Esc>:m-2<CR>gi
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv

" }}}1

" Abbrivations {{{1

iab py#! #!/usr/bin/env python
iab sh#! #!/bin/sh
iab bash#! #!/bin/bash
iab ddd say STDERR Mojo::Util::dumper

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

function! ToggleWorklogEntry()
    if getline(".") =~ '\[ \]'
        exec "s/\\[.\\]/[x]/"
    else
        exec "s/\\[.\\]/[ ]/"
    endif
    normal ``
endfunction

function!GetWorklogFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_level = indent(a:lnum) / &shiftwidth
    let next_level = indent(a:lnum + 1) / &shiftwidth
    if next_level > this_level
        return '>' . next_level
    else
        return this_level
endfunction


function! OpenWorklog()
    silent! botright vertical 70 new
    edit ~/worklog.txt
    setl shiftwidth=4
    setl foldlevel=3
    setl foldmethod=expr
    setl foldexpr=GetWorklogFold(v:lnum)
    nmap <buffer> <CR> :w<CR>:bd<CR>
    nmap <buffer> <Space> :call ToggleWorklogEntry()<CR>
    setl autoindent
    normal! zz
endfunction
nnoremap <silent> <F6> :call OpenWorklog()<CR>

" }}}1

au! BufWritePost .vimrc source %

