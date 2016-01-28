" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd BufRead,BufNewFile wscript* setfiletype=python
    autocmd BufRead,BufNewFile *.md setfiletype=markdown
    autocmd BufRead,BufNewFile *.ja setfiletype=janus
    autocmd BufRead,BufNewFile *.tikz setfiletype=tex
    autocmd BufRead,BufNewFile *.html*.ep setfiletype=html.epl
    autocmd BufRead,BufNewFile *.go setfiletype=go
augroup END
