" Maintainer:   Lars H. Nielsen (dengmao@gmail.com)
" Last Change:  January 22 2007
" Modifications by Michael Budde <mbudde@gmail.com>

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"

if exists("b:current_syntax") && b:current_syntax == 'python'
  syn keyword pythonSelf self
endif

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine                 guibg=#1f1f1f           ctermbg=black cterm=none
  hi CursorColumn               guibg=#2d2d2d
  hi MatchParen   guifg=#f6f3e8 guibg=#343b21 gui=bold
  hi Pmenu        guifg=#f6f3e8 guibg=#444444
  hi PmenuSel     guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor       guifg=#000000 guibg=fg      gui=none
hi Normal       guifg=#f6f3e8 guibg=#000000 gui=none
hi NonText      guifg=#2e3436 guibg=#000000 gui=none
hi LineNr       guifg=#303030 guibg=#000000 gui=none    ctermfg=black
hi StatusLine   guifg=#c9c9c9 guibg=#242424 gui=italic
hi StatusLineNC guifg=#707070 guibg=#242424 gui=none
hi VertSplit    guifg=#242424 guibg=#242424 gui=none
hi Folded       guifg=#a0a8b0 guibg=#384048 gui=none
hi Title        guifg=#f6f3e8               gui=bold
hi Visual                     guibg=#2b2b2b gui=none
hi SpecialKey   guifg=#808080 guibg=#343434 gui=none
hi Search                     guibg=#e9b96e
hi ErrorMsg                   guibg=#ef2929

"Syntaxhighlighting
hi Comment      guifg=#555753               gui=none    ctermfg=darkgray
hi Todo         guifg=#000000 guibg=#edd400 gui=none    ctermfg=black       ctermbg=yellow
hi Error                      guibg=#ef2929             ctermfg=white       ctermbg=red
hi Constant     guifg=#ad7fa8
hi String       guifg=#4e9a06               gui=none    ctermfg=darkgreen
hi Identifier   guifg=#c4a000               gui=none    ctermfg=brown                  cterm=none
hi Function     guifg=#8ae234               gui=none    ctermfg=magenta
hi Type         guifg=#a8e36d               gui=none    ctermfg=green
hi Statement    guifg=#729fcf               gui=none    ctermfg=blue
hi Keyword      guifg=#8ac6f2               gui=none    ctermfg=blue
hi PreProc      guifg=#ad7fa8               gui=none    ctermfg=magenta
hi Number       guifg=#e5786d               gui=none    ctermfg=red
hi Special      guifg=#fced74               gui=none    ctermfg=yellow

"Diffcolors
hi DiffAdd                    guibg=#206c20
hi DiffDelete   guifg=#6c2020 guibg=#6c2020
hi DiffChange                 guibg=#49354e
hi DiffText     guifg=#000000 guibg=#996fa3 gui=none
hi SignColumn   guifg=#b4c1cf guibg=#384048             ctermfg=gray        ctermbg=black
hi Folded                                               ctermfg=gray        ctermbg=black
hi FoldColumn   guifg=#b4c1cf guibg=#2e3436             ctermfg=gray        ctermbg=black

hi pythonSelf   guifg=#bfbfbf
"hi pythonBuiltin guifg=#
