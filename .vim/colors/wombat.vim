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
  hi CursorLine                 guibg=#2d2d2d           ctermbg=black cterm=none
  hi CursorColumn               guibg=#2d2d2d
  hi MatchParen   guifg=#f6f3e8 guibg=#343b21 gui=bold
  hi Pmenu        guifg=#f6f3e8 guibg=#444444
  hi PmenuSel     guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor                     guibg=#656565 gui=none
hi Normal       guifg=#f6f3e8 guibg=#242424 gui=none
hi NonText      guifg=#808080 guibg=#303030 gui=none
hi LineNr       guifg=#3d3d3d guibg=#242424 gui=none    ctermfg=black
hi StatusLine   guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi VertSplit    guifg=#444444 guibg=#444444 gui=none
hi Folded       guifg=#a0a8b0 guibg=#384048 gui=none
hi Title        guifg=#f6f3e8               gui=bold
hi Visual                     guibg=#444444 gui=none
hi SpecialKey   guifg=#808080 guibg=#343434 gui=none
hi Search                     guibg=#e9b96e
hi ErrorMsg                   guibg=#ef2929

"Syntaxhighlighting
hi Comment      guifg=#99968b               gui=none    ctermfg=darkgray
hi Todo         guifg=#2e3436 guibg=#fce94f gui=none    ctermfg=black       ctermbg=yellow
hi Error                      guibg=#ef2929             ctermfg=white       ctermbg=red
hi Constant     guifg=#e5786d               gui=none
hi String       guifg=#95e454               gui=none    ctermfg=darkgreen
hi Identifier   guifg=#cae682               gui=none    ctermfg=brown                  cterm=none
hi Function     guifg=#cae682               gui=none    ctermfg=magenta
hi Type         guifg=#cae682               gui=none    ctermfg=green
hi Statement    guifg=#8ac6f2               gui=none    ctermfg=blue
hi Keyword      guifg=#8ac6f2               gui=none    ctermfg=blue
hi PreProc      guifg=#e5786d               gui=none    ctermfg=magenta
hi Number       guifg=#e5786d               gui=none    ctermfg=red
hi Special      guifg=#e7f6da               gui=none    ctermfg=yellow

"Diffcolors
hi DiffAdd                    guibg=#206c20
hi DiffDelete   guifg=#6c2020 guibg=#6c2020
hi DiffChange                 guibg=#49354e
hi DiffText     guifg=#000000 guibg=#996fa3 gui=none
hi SignColumn   guifg=#b4c1cf guibg=#384048             ctermfg=gray        ctermbg=black
hi Folded                                               ctermfg=gray        ctermbg=black
hi FoldColumn   guifg=#b4c1cf guibg=#384048             ctermfg=gray        ctermbg=black

hi pythonSelf   guifg=#bfbfbf
"hi pythonBuiltin guifg=#
