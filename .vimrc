" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'hdima/python-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-smooth-scroll'
Plug 'matze/vim-move'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'dikiaap/minimalist'
Plug 'ervandew/supertab'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/syntastic'
Plug 'whatyouhide/vim-gotham'

" All of your Plugins must be added before the following line
call plug#end()
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent code 
vnoremap < <gv
vnoremap > >gv


set nobackup
set nowb
set noswapfile

set laststatus=2

set t_Co=256
syntax on
colorscheme gotham

set encoding=utf8

" Sets how many lines of history VIM has to remember
set history=500

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

nnoremap <leader>p oimport ipdb;ipdb.set_trace()<Esc>

" Marker for change, replace etc.
set cpoptions+=$
syntax on
set relativenumber
set number
set numberwidth=3

map <leader>pp :setlocal paste!<cr>

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>m <Esc>:tabnext<cr> 
map <leader>n <Esc>:tabprevious<cr> 

nnoremap <silent> <esc> :noh<cr><esc>

set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins settings:

let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let python_highlight_all = 1

let g:airline_theme='simple'

let g:airline#extensions#tabline#enabled = 1

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


"let g:move_key_modifier = 'C'
map <C-n> :NERDTreeToggle<CR>

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <leader>lc :lclose<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoload vimrc on change

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
