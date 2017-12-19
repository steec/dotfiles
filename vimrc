syntax on
filetype plugin indent on

au filetype java setlocal mp=javac\ %
au filetype cpp setlocal mp=g++\ %
au filetype c setlocal mp=gcc\ %

:let java_highlight_all=1

set guifont=Inconsolata\ 9
set nu
set nocompatible
set tabstop=4
set shiftwidth=4
set background=light
set history=50
set wildmode=list:longest,full
set shortmess+=r
set showmode
set showcmd
set nomodeline
set ignorecase
set smartcase
set t_Co=256
set hlsearch
set vb t_vb=".
set incsearch
colorscheme bubblegum2-mine
"colorscheme molokai
"colo mine

"set cursorline
"hi clear Cursorline 
"hi Cursorline gui=underline cterm=underline

"toggle NERDTree
map <silent> <F3> :NERDTree<CR>

"Press Space to turn off highlighting and clear any message
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set guioptions-=r

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <Bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Powerline config
set laststatus=2
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
