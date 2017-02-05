set colorcolumn=100 " Show column line at 100

set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" gf runs `rustfmt` on the current file
nmap <silent> gf :RustFmt<cr>

" :CargoBuild runs `cargo build`
command! -buffer CargoBuild exe ':!cargo build'
" gb runs `cargo build`
nmap gb :CargoBuild<cr>

command! -buffer CargoRun exe ':!cargo run'
" gb runs `cargo build`
nmap gr :CargoRun<cr>

" gc opens definition in current buffer
nmap gc <Plug>(rust-def)
" go opens definition in horizontal split
nmap go <Plug>(rust-def-split)
" ge opens definition in vertical split
nmap ge <Plug>(rust-def-vertical)
" gd opens markdown documentation in horizontal split
nmap gd <Plug>(rust-doc)

