""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle and plugin setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle must be installed manually
" https://github.com/gmarik/vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'
" Ability to repeat (.) tpope plugin commands
Plugin 'tpope/vim-repeat'
" Asynchronous job running
Plugin 'tpope/vim-dispatch'
" Git wrapping
Plugin 'tpope/vim-fugitive'
" Support for easily toggling comments
Plugin 'tpope/vim-commentary'
" Surround text with chars (brackets, etc.)
Plugin 'tpope/vim-surround'
" Autocomplete braces
Plugin 'jiangmiao/auto-pairs'
" Snippet engine
Plugin 'SirVer/ultisnips'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
" Better '%' matching
Plugin 'tmhedberg/matchit'
" Text alignment commands
Plugin 'godlygeek/tabular'
" Markdown highlighting
Plugin 'plasticboy/vim-markdown'
" JSON highlighting
Plugin 'elzr/vim-json'
" Fish highlighting
Plugin 'dag/vim-fish'
" Rust highlighting
Plugin 'rust-lang/rust.vim'
" Rust intellisense
Plugin 'racer-rust/vim-racer'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General defaults
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetype auto-detection
filetype plugin indent on

" UTF-8 encoding
set encoding=utf8
" Tab width 4 characters
set tabstop=4
set shiftwidth=4
" Use spaces over tabs
set expandtab
" Tab key moves to the next indent
set smarttab
" Tab / shifting moves to closest tabstop
set shiftround
" Match indents on new lines
set autoindent
" Intelligently indent / dedent new lines based on rules
set smartindent
" 'Hybrid' number view
set number
set relativenumber
" Show filename
set laststatus=2
" Always show current position
set ruler
" Buffer 5 lines above and below the cursor
set so=5
" Wrap lines to the window buffer
set wrap
" Show column line at 80
set colorcolumn=80
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" 'h' and 'l' move across lines
set whichwrap+=<,>,h,l
" VCS makes backups and .swp files obsolete - disable them
set nobackup
set nowritebackup
set noswapfile
" Allow buffers with unsaved changes
set hidden
" When a file has changed on disk load it without asking
set autoread
" Use the unnamedplus ("+) register; specific to Arch Linux
set clipboard=unnamedplus
" Case insensitive search unless there are uppercase letters
set ignorecase
set smartcase
" Live incremental searching
set incsearch
" Live match highlighting
set showmatch
" Highlight matches
set hlsearch
" Use the `g` flag in regex substitutes
set gdefault
" Regular expressions in search
set magic
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Allow the cursor to go anywhere in visual block mode.
set virtualedit+=block
" No sound on errors
set noerrorbells
set novisualbell
set tm=500
" Keep folds open on load
set foldlevelstart=20
" Turn on the wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" Persistent undo: undo even after closing a buffer or vim
try
  set undodir=~/.vim/tmp/undo
  set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap ctrl-p to ctrl-e
let g:ctrlp_map = '<c-e>'
" Let ctrl-p have up to 30 results.
let g:ctrlp_max_height = 30
" CtrlP should ignore the same files that Git does
let g:ctrlp_user_command =
      \ ['.git', 'cd %s && git ls-files -co --exclude-standard']
" UltiSnips next and prev positions through tab / shift-tab
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
" Python snippets should use Google style docstrings
let g:ultisnips_python_style = 'google'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions and autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
      \ | exe "normal! g'\"" | endif
" Delete trailing whitespace on save
func! DeleteTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.* :call DeleteTrailingWhitespace()
" Auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
" Auto close the preview pane in autocomplete
autocmd CompleteDone * pclose

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings and macros
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader> key is ','
let mapleader = ","
let g:mapleader = ","

" Get to command mode faster via ';'
noremap ; :
" Remap 0 to first non-blank char
nnoremap 0 ^
" Ctrl-d closes current buffer
nnoremap <C-d> :bd<cr>
" Clear match highlighting
nnoremap <silent> <leader><space> :noh<cr>
" New splits
nnoremap <C-w><C-e> :vsplit<cr>
nnoremap <C-w><C-o> :split<cr>
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
" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>
" Move down on wrapped lines
noremap j gj
noremap k gk
" Fold with spacebar
nnoremap <space> za
vnoremap <space> zf
" Map '/' to toggle comments with vim-commentary
nnoremap <C-_> :Commentary<cr>
vnoremap <C-_> :Commentary<cr>
" :W sudo saves the file (useful for handling permission denied errors)
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax on
" Highlight trailing whitespace
match ErrorMsg '\s\+$'
" Found in ~/.vim/colors
colorscheme custom-material
" No background color
hi Normal ctermbg=none
