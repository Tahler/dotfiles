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

" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'tomasiser/vim-code-dark'

" EditorConfig support
Plug 'editorconfig/editorconfig-vim'

" Surround text with chars (brackets, etc.)
Plug 'tpope/vim-surround'

" Autocomplete braces
Plug 'jiangmiao/auto-pairs'

" Support for easily toggling comments
Plug 'tpope/vim-commentary'

" Enable '.' repetition for many plugins
Plug 'tpope/vim-repeat'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""
" Display "
"""""""""""

" Show hybrid line numbers
set number
set relativenumber

"""""""""""""""
" Status line "
"""""""""""""""

" Always show status line
set laststatus=2

" Path to the file
set statusline=\ %f

" Modified flag
set statusline+=\ %m

" File type
set statusline+=\ %y

" Switch to the right side
set statusline+=%=

" $currentLine/$numLines $columnNum
set statusline+=%l/%L\ %v\ "

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
map Q <nop>

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
let &t_SI .= "\<esc>[?2004h"
let &t_EI .= "\<esc>[?2004l"
inoremap <special> <expr> <esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<esc>[201~
  set paste
  return ""
endfunction

" Auto close the preview pane in autocomplete
autocmd! CompleteDone * pclose

" Auto reload Vim config on save
autocmd! BufWritePost vimrc,*.vimrc source %

" Copying to system clipboard with <leader>y
map <leader>y <plug>(operator-poweryank-osc52)

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
nnoremap <c-d> :bd<cr>

" Do not skip over auto-wrapped lines
nnoremap j gj
nnoremap k gk

" gJ: Move the above line to the cursor.
nnoremap gJ kddpkJ

" New splits
nnoremap <c-w>\ :vsplit<cr>
nnoremap <c-w>- :split<cr>

" Faster movement between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Faster rearrangement of splits
nnoremap <c-w><c-v> <c-w><c-t><c-w>H
nnoremap <c-w><c-h> <c-w><c-t><c-w>K

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<c-n>")
inoremap <expr> <c-k> ("\<c-p>")

" Quick buffer switching - like ctrl-tabbing
nnoremap <leader><leader> <c-^>

" Map '/' to toggle comments with vim-commentary
nnoremap <silent> <c-_> :Commentary<cr>
vnoremap <silent> <c-_> :Commentary<cr>

" Fuzzy file finder with ctrl-e
nnoremap <c-e> :Files<cr>

" Quick search and replace
nnoremap <leader>sub :%s///g<left><left>
vnoremap <leader>sub :s///g<left><left>

" Clear match highlighting
nnoremap <silent> <leader><space> :noh<cr>

" :W sudo saves the file (useful for handling permission denied errors)
command! W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and highlighting                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Column marker
set textwidth=80
set colorcolumn=+1

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" Use VS Code dark colorscheme
" https://github.com/tomasiser/vim-code-dark
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
