""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      _                                                                       "
" __ _(_)_ __  _ _ __                                                          "
" \ V / | '  \| '_/ _|                                                         "
"(_)_/|_|_|_|_|_| \__|                                                         "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tyler Berry                                                                  "
" tyler@berryac.com                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No need to be compatible with vi
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
" Vundle "
""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Surround text with chars (brackets, etc.)
Plugin 'tpope/vim-surround'

" Autocomplete braces
Plugin 'jiangmiao/auto-pairs'

" Support for easily toggling comments
Plugin 'tpope/vim-commentary'

" Enable '.' repetition for many plugins
Plugin 'tpope/vim-repeat'

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" Text alignment commands
Plugin 'junegunn/vim-easy-align'

" Copying to the system clipboard with text-objects and motions
Plugin 'christoomey/vim-system-copy'

" Auto close HTML tags
Plugin 'alvan/vim-closetag'

" Better '%' matching
Plugin 'tmhedberg/matchit'

" Snippet engine
Plugin 'SirVer/ultisnips'

" VS Code colors
Plugin 'tomasiser/vim-code-dark'

" TypeScript support
Plugin 'leafgarland/typescript-vim'

" Elm support
Plugin 'ElmCast/elm-vim'

call vundle#end()

" Filetype detection via the detect, plugin, and indent directories under ~/.vim
" Required after Vundle plugins
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""
" Display "
"""""""""""

" Show line numbers
set number

" Show current position
set ruler

"""""""""""""""
" Status line "
"""""""""""""""

" Always show status line
set laststatus=2

" Path to the file
set statusline=\ %f

" Modified flag
set statusline+=\ %m

" Filetype
set statusline+=\ %y

" Switch to the right side
set statusline+=%=

" Current/total lines
set statusline+=%l/%L

""""""""
" Tabs "
""""""""

" Tab key moves to the next indent
set smarttab

" Show existing tabs with 4 spaces width
set tabstop=4

" On pressing tab, insert 4 spaces
set softtabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" When indenting with '>', round to multiple of shiftwidth
set shiftround

" Use spaces rather than tabs
set expandtab

""""""""""""""""""""""
" Search and replace "
""""""""""""""""""""""

" Highlight matches
set hlsearch

" Live incremental searching
set incsearch

" Case insensitive search unless there are uppercase letters
set ignorecase
set smartcase

" Use the `g` flag in regex substitutes
set gdefault

" Regular expressions in search
set magic

"""""""""""""
" Wild menu "
"""""""""""""

" Turn on the wild menu
set wildmenu

" Ignore compiled and managed files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"""""""""""""""""
" Miscellaneous "
"""""""""""""""""

" Never use Ex mode
map Q <Nop>

" Buffer 5 lines above and below the cursor
set scrolloff=5

" Wrap lines to the window buffer
set wrap

" Backspace acts as it should
set backspace=eol,start,indent

" 'h' and 'l' move across lines
set whichwrap+=<,>,h,l

" Allow mouse (useful for resizing splits)
set mouse=a

" VCS makes backups and .swp files obsolete - disable them
set nobackup
set nowritebackup
set noswapfile

" When a file has changed on disk load it without asking
set autoread

" Allow buffers to exist in the background without being in a window
set hidden

" Automatically :write before running commands
set autowrite

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

" Persistent undo: undo even after closing a buffer or vim
if has('persistent_undo') && isdirectory(expand('~').'/.vim/tmp/undo')
  silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
  set undodir=~/.vim/tmp/undo
  set undofile
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions and autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files
autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
      \ | exe "normal! g'\"" | endif

" Delete trailing whitespace on save
function! DeleteTrailingWhitespace()
  execute "normal mz"
  %s/\s\+$//ge
  execute "normal `z"
endfunction
autocmd BufWrite *.* :call DeleteTrailingWhitespace()

" Auto paste mode (prevent auto-indenting pasted text)
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Auto close the preview pane in autocomplete
autocmd! CompleteDone * pclose

" Auto reload Vim config on save
autocmd! BufWritePost vimrc,*.vimrc source %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings and macros                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader> key is ','
let mapleader = ","
let g:mapleader = ","

" Get to command mode faster via ';'
noremap ; :

" Swap 0 and ^ behaviors
nnoremap 0 ^
nnoremap ^ 0

" Ctrl-d closes current buffer
nnoremap <C-d> :bd<cr>

" Do not skip over auto-wrapped lines
nnoremap j gj
nnoremap k gk

" Reverse of join (J) with gJ
nnoremap gJ kddpkJ

" New splits
nnoremap <C-w>\ :vsplit<cr>
nnoremap <C-w>- :split<cr>

" Faster movement between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Faster rearrangement of splits
nnoremap <C-w><C-v> <C-w><C-t><C-w>H
nnoremap <C-w><C-h> <C-w><C-t><C-w>K

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" Quick buffer switching - like ctrl-tabbing
nnoremap <leader><leader> <c-^>

" Map '/' to toggle comments with vim-commentary
nnoremap <silent> <C-_> :Commentary<cr>
vnoremap <silent> <C-_> :Commentary<cr>

" Quick search and replace
nnoremap <leader>sub :%s///g<left><left>
vnoremap <leader>sub :s///g<left><left>

" Clear match highlighting
nnoremap <silent> <leader><space> :noh<cr>

" :W sudo saves the file (useful for handling permission denied errors)
command! W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
" Ctrl-P "
""""""""""

" Remap ctrl-p to ctrl-e
let g:ctrlp_map = '<c-e>'

" Let ctrl-p have up to 30 results.
let g:ctrlp_max_height = 30

" CtrlP should ignore the same files that Git does
let g:ctrlp_user_command =
      \ ['.git', 'cd %s && git ls-files -co --exclude-standard']

"""""""""""""
" UltiSnips "
"""""""""""""

" UltiSnips next and prev positions through tab / shift-tab
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'

" Python snippets should use Google style docstrings
let g:ultisnips_python_style = 'google'
let g:ultisnips_python_quoting_style = 'single'
let g:ultisnips_python_triple_quoting_style = 'double'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and highlighting                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Column marker
set textwidth=80
set colorcolumn=+1

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" Use VS Code dark colorscheme
set t_Co=256
set t_ut=
colorscheme codedark

" Syntax highlighting
if !exists('g:syntax_on')
  syntax enable
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source .*.vimrc files                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

for vimrc in systemlist(
    \ 'find "$HOME" -maxdepth 1 \( -type l -o -type f \) -name ".*.vimrc"')
  exec 'source' vimrc
endfor
