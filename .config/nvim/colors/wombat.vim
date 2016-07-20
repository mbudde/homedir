" Maintainer:   Michael Budde <mbudde@gmail.com>
" Last Change:  March 2016

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"

hi Normal           cterm=none      ctermfg=255         ctermbg=234
hi LineNr           cterm=none      ctermfg=240
hi SignColumn                                           ctermbg=234
hi StatusLineNC     cterm=none                          ctermbg=236
hi CursorLine       cterm=none                          ctermbg=233
hi VertSplit        cterm=none                          ctermbg=235
hi WildMenu                                             ctermbg=220
hi Visual                                               ctermbg=53
hi Folded                           ctermfg=241         ctermbg=235
hi TabLine          cterm=none      ctermfg=250         ctermbg=236
hi TabLineSel       cterm=bold      ctermfg=255         ctermbg=240
hi Pmenu                            ctermfg=251         ctermbg=233
hi PmenuSel                         ctermfg=253         ctermbg=52
hi MatchParen                                           ctermbg=125
hi Conceal                          ctermfg=NONE        ctermbg=NONE
hi! link TabLineFill Normal

hi Search                           ctermfg=202         ctermbg=236

hi Comment          cterm=none      ctermfg=244
hi Constant         cterm=none      ctermfg=73
hi Identifier       cterm=none      ctermfg=81
hi Function         cterm=none      ctermfg=13
hi Type             cterm=none      ctermfg=221
hi Statement        cterm=none      ctermfg=108
hi PreProc          cterm=none      ctermfg=203
hi Special                          ctermfg=171

hi DiffAdd                          ctermfg=2           ctermbg=none
hi DiffChange                       ctermfg=5           ctermbg=none
hi DiffDelete                       ctermfg=1           ctermbg=none
hi DiffText                         ctermfg=3           ctermbg=none
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link diffChanged DiffChange

hi podCmdText                       ctermfg=70
hi podSpecial                       ctermfg=252
hi podFormat                        ctermfg=252
hi podVerbatimLine                  ctermfg=252

hi link perlPOD Comment
hi link perlSubName Function
hi link perlVarPlain Type
hi link perlVarPlain2 Identifier
