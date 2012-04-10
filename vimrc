syntax on
filetype plugin indent on

au filetype java setlocal mp=javac\ %
au filetype cpp setlocal mp=g++\ %
au filetype c setlocal mp=gcc\ %

:let java_highlight_all=1

set nu
set nocompatible
set tabstop=2
set shiftwidth=2
set background=dark
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
"colorscheme wombat256-mine
colorscheme bubblegum2

"Press Space to turn off highlighting and clear any message
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
