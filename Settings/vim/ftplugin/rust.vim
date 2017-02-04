set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" gc opens definition in current buffer
nmap gc <Plug>(rust-def)
" go opens definition in horizontal split
nmap go <Plug>(rust-def-split)
" ge opens definition in vertical split
nmap ge <Plug>(rust-def-vertical)
" gd opens markdown documentation in horizontal split
nmap gd <Plug>(rust-doc)

set colorcolumn=100 " Show column line at 100

