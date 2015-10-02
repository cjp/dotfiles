execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set background=dark " dark | light "
colorscheme solarized
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_termtrans=1
set number
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.md set sw=2
set cursorline
set colorcolumn=80
set ts=4
set expandtab
call togglebg#map("<F5>")
