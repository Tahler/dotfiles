" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let vundle manage itself:
Plugin 'gmarik/vundle'

" Python code folding
Plugin 'tmhedberg/SimpylFold'

" Just a lot of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Plugin 'flazz/vim-colorschemes'

" Fuzzy finder
Plugin 'kien/ctrlp.vim'

" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

Plugin 'leshill/vim-json'

Plugin 'tpope/vim-markdown'

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set number " Show line numbers

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" No nagging when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" Get to command mode via ';' rather than ':'
nnoremap ; :
vnoremap ; :

" leader is a key that allows you to have your own "namespace" of keybindings
" Referenced below as <leader>
let mapleader = ","

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regexs when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Keep folds open on load
set foldlevelstart=20

" Fold with spacebar
nnoremap <space> za
vnoremap <space> zf

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
nnoremap <C-_> :Commentary<cr>
vnoremap <C-_> :Commentary<cr>

" Let Simpylfold show the Python docstrings
let g:SimpylFold_docstring_preview=1

" Remap ctrl-p to ctrl-t
let g:ctrlp_map = '<c-t>'

" Let ctrl-p have up to 30 results.
let g:ctrlp_max_height = 30

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" Delete trailing whitespace
nnoremap <Leader>w :%s/\s\+$//e<CR>

" Color scheme (looks in ~/.vim/colors)
colorscheme ubuntu
" No background color
hi Normal ctermbg=none

