use v5.10;

$preview_continuous_mode = 1;

$pdf_mode = 1;
$pdflatex_compiler = $ENV{PDFLATEX} ? "pdflatex" : "lualatex";
$pdflatex = "$pdflatex_compiler --shell-escape --interaction=nonstopmode %O %S";

say "Latex compiler: $pdflatex_compiler";

$pdf_previewer = 'evince %S';
$pdf_update_method = 0;

push @generated_exts, 'snm';
push @generated_exts, 'nav';
push @generated_exts, 'pyg';
push @generated_exts, 'bfc';
push @generated_exts, 'run.xml';
