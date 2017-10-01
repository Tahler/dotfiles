""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tyler Berry's Vim configuration
" tyler@berryac.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setup                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

""""""""""""""""""
" Vundle plugins "
""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
" Support for easily toggling comments
Plugin 'tpope/vim-commentary'
" Surround text with chars (brackets, etc.)
Plugin 'tpope/vim-surround'
" Autocomplete braces
Plugin 'jiangmiao/auto-pairs'
" Snippet engine
Plugin 'SirVer/ultisnips'
" Better '%' matching
Plugin 'tmhedberg/matchit'
" Text alignment commands
Plugin 'godlygeek/tabular'

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General defaults                                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" Always show current position
set ruler
" Show filename
set laststatus=2
" Buffer 5 lines above and below the cursor
set so=5
" Wrap lines to the window buffer
set wrap
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" 'h' and 'l' move across lines
set whichwrap+=<,>,h,l
" Allow mouse scrolling
set mouse=a
" VCS makes backups and .swp files obsolete - disable them
set nobackup
set nowritebackup
set noswapfile
" Allow buffers with unsaved changes
set hidden
" When a file has changed on disk load it without asking
set autoread
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
" Key mappings and macros                                                      "
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
" Do not skip over auto-wrapped lines
nnoremap j gj
nnoremap k gk
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
nnoremap <C-_> :Commentary<cr>
vnoremap <C-_> :Commentary<cr>
" Clear match highlighting
nnoremap <silent> <leader><space> :noh<cr>
" :W sudo saves the file (useful for handling permission denied errors)
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and highlighting                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax on
" Highlight trailing whitespace
match ErrorMsg '\s\+$'
" Found in ~/.vim/colors
colorscheme custom-material
" No background color
hi Normal ctermbg=none

" Syntax highlighting
syntax on
