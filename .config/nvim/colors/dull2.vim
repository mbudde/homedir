" Maintainer:   Michael Budde <mbudde@gmail.com>
" Last Change:  March 2016

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "dull2"

let g:terminal_color_0 = "#2E3436"
let g:terminal_color_1 = "#CC0000"
let g:terminal_color_2 = "#4E9A06"
let g:terminal_color_3 = "#C4A000"
let g:terminal_color_4 = "#3465A4"
let g:terminal_color_5 = "#75507B"
let g:terminal_color_6 = "#06989A"
let g:terminal_color_7 = "#D3D7CF"
let g:terminal_color_8 = "#555753"
let g:terminal_color_9 = "#EF2929"
let g:terminal_color_10 = "#8AE234"
let g:terminal_color_11 = "#FCE94F"
let g:terminal_color_12 = "#729FCF"
let g:terminal_color_13 = "#AD7FA8"
let g:terminal_color_14 = "#34E2E2"
let g:terminal_color_15 = "#EEEEEC"

hi Normal           cterm=none      ctermfg=255     ctermbg=234     gui=none    guifg=#eeeeee   guibg=#1c1c1c
hi LineNr           cterm=none      ctermfg=240                     gui=none    guifg=#585858
hi SignColumn                                       ctermbg=234                                 guibg=#1c1c1c
hi StatusLineNC     cterm=none                      ctermbg=236     gui=none                    guibg=#303030
hi Cursor           cterm=reverse   ctermfg=none    ctermbg=none    gui=reverse guifg=none      guibg=none
hi CursorLine       cterm=none                      ctermbg=233     gui=none                    guibg=#121212
hi CursorLineNr     cterm=none                      ctermbg=233     gui=none    guifg=#fce94f
hi VertSplit        cterm=none                      ctermbg=235     gui=none                    guibg=#262626
hi WildMenu                                         ctermbg=220                                 guibg=#ffdf00
hi Visual                                           ctermbg=53                                  guibg=#5f005f
hi Folded                           ctermfg=241     ctermbg=235                 guifg=#606060   guibg=#262626
hi FoldColumn                                       ctermbg=234                 guifg=#248f8b   guibg=#262626
hi TabLine          cterm=none      ctermfg=250     ctermbg=236     gui=none    guifg=#bcbcbc   guibg=#303030
hi TabLineSel       cterm=bold      ctermfg=255     ctermbg=240     gui=bold    guifg=#eeeeee   guibg=#585858
hi TabLineFill                                                                  guifg=#303030
hi Pmenu                            ctermfg=251     ctermbg=233                 guifg=#c6c6c6   guibg=#121212
hi PmenuSel                         ctermfg=253     ctermbg=52                  guifg=#dadada   guibg=#5f0000
hi MatchParen                                       ctermbg=125                                 guibg=#af005f
hi Conceal                          ctermfg=none    ctermbg=none
hi NonText                          ctermfg=236     ctermbg=233                 guifg=#303030   guibg=#121212

hi Search                           ctermfg=202     ctermbg=236     gui=none    guifg=#ff5f00   guibg=#303030
hi IncSearch        cterm=none      ctermfg=233     ctermbg=214     gui=none    guifg=#121212   guibg=#ffaf00

hi Comment          cterm=none      ctermfg=244                     gui=none    guifg=#aaaaaa
hi Constant         cterm=none      ctermfg=73                      gui=none    guifg=#dddddd
hi String                                                           gui=none    guifg=#add8b4
hi Character                                                        gui=none    guifg=#add8b4
hi Number                                                           gui=none    guifg=#97b9d8
hi Float                                                            gui=none    guifg=#97b9d8
hi Identifier       cterm=none      ctermfg=81                      gui=none    guifg=#dddddd
hi Function         cterm=none      ctermfg=13                      gui=none    guifg=#c397d8
hi Type             cterm=none      ctermfg=221                     gui=none    guifg=#dddddd
hi Statement        cterm=bold      ctermfg=108                     gui=bold    guifg=#dddddd
hi Operator         cterm=bold      ctermfg=108                     gui=none    guifg=#dddddd
hi PreProc          cterm=none      ctermfg=203                     gui=bold    guifg=#ffffff
hi Special                          ctermfg=171                     gui=none    guifg=#dddddd

"guibg=#2e3d0f   #3d5214  guifg=
hi DiffAdd                                          ctermbg=22                                  guibg=#0f3d0f
hi DiffChange                                       ctermbg=22                                  guibg=#0f3d0f
hi DiffDelete                                       ctermbg=52      gui=none    guifg=#f5d6d6   guibg=#7a1f1f
hi DiffText                                         ctermbg=28      gui=none    guifg=none      guibg=#145214
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link diffChanged DiffChange
hi! link GitGutterAdd DiffAdd
hi! link GitGutterChange DiffChange
hi! link GitGutterDelete DiffDelete

hi podCmdText                       ctermfg=70                                  guifg=#5faf00
hi podSpecial                       ctermfg=252                                 guifg=#d0d0d0
hi podFormat                        ctermfg=252                                 guifg=#d0d0d0
hi podVerbatimLine                  ctermfg=252                                 guifg=#d0d0d0

hi link perlPOD Comment
hi link perlSubName Function
hi link perlVarPlain Identifier
hi link perlVarPlain2 Identifier
hi link perlBraces Special
hi link perlMatchStartEnd String
hi link perlSpecialMatch String
hi link perlSpecialString String
hi link perlControl Conditional

hi link javascriptBraces Special
hi link javascriptFunction Keyword
hi link javascriptNumber Number
hi link javaScriptBoolean Keyword

hi link cssBraces Special

hi link sassAmpersand Keyword

hi link htmlTag Special
hi link htmlH1 String
hi link htmlH2 String
hi link htmlH3 String
hi link htmlH4 String
hi link htmlH5 String
hi link htmlH6 String

hi link MojoStart Function
hi link MojoSingleStart Function
hi link MojoEnd Function

hi NeomakeWarning   cterm=underline ctermfg=220                                 guifg=#ffdf00
hi link NeomakeWarningSign NeomakeWarning
hi link NeomakeVirtualtextMessage Comment
hi link NeomakeVirtualtextWarning Comment
hi link NeomakeVirtualtextInfo Comment
hi link NeomakeVirtualtextError Comment

hi ConflictMarker                                                               guifg=#43d0ce   guibg=#104140

autocmd Syntax * syntax match ConflictMarker containedin=ALL /^\%(<<<<<<<<\@!\|||||||||\@!\|========\@!\|>>>>>>>>\@!\).*$/
