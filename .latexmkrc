
$pdf_mode = 1;
$pdflatex = 'lualatex --shell-escape --interaction=nonstopmode %O %S';

$pdf_previewer = 'evince %S';
$pdf_update_method = 0;

$bibtex_use = 2;

push @generated_exts, 'snm';
push @generated_exts, 'nav';
push @generated_exts, 'pyg';
push @generated_exts, 'bfc';
push @generated_exts, 'run.xml';
