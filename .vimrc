set nocompatible
filetype off

"Bundle 配置
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'VundleVim/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'taglist.vim'
Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'SuperTab'
Bundle 'tpope/vim-surround'
Bundle 'auto-pairs'
Bundle 'tpope/vim-commentary'
Bundle 'lua.vim'
Bundle 'vim-misc'
Bundle 'plasticboy/vim-markdown'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

"基本配置
set history=1000
set ruler
set number
set showcmd
set showmode
set laststatus=2
set cmdheight=2
set scrolloff=3

"Fill space between windows
set fillchars=stl:\ ,stlnc:\ ,vert:\

"关闭annoying error sound
set noerrorbells
set novisualbell
set t_vb=

"关闭splash screen
set shortmess=atI

"语法与风格设置
syntax on
colorscheme desert
set background=dark
set cursorline
set cursorcolumn

"配置空格
set backspace=2
set whichwrap=<,>,h,l

"Tab and indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set cindent

"File,backups and encoding
set nobackup
set noswapfile
set autoread
set autowrite
set autochdir
set fileencodings=utf-8,gbk,gb2312
set fileformats=unix,dos,mac
filetype plugin on
filetype indent on

"Text search and replace
set showmatch
set matchtime=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set magic
set nowrapscan
set iskeyword+=_,$,@,%,#,-,.

"设置VIM状态栏 
set laststatus=2 "显示状态栏(默认值为1, 无法显示状态栏) 
set statusline= 
set statusline+=%2*%-3.3n%0*\ " buffer number 
set statusline+=%f\ " file name 
set statusline+=%h%1*%m%r%w%0* " flag 
set statusline+=[ 
if v:version >= 600 
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype 
    set statusline+=%{&fileencoding}, " encoding 
endif 
set statusline+=%{&fileformat}] " file format 
set statusline+=%= " right align 
"set statusline+=%2*0x%-8B\ " current char 
set statusline+=0x%-8B\ " current char 
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset 
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim")) 
    set statusline+=\ %{VimBuddy()} " vim buddy 
endif 
"状态行颜色 
"highlight StatusLine guifg=SlateBlue guibg=Yellow 
"highlight StatusLineNC guifg=Gray guibg=White 
set hidden
set wildmenu
set list
set listchars=tab:>-,trail:-

"Gvim config
if has("gui_running")
    colorscheme solarized
endif
set guifont=DejaVu\ Sans\ Mono\ 13
set guioptions=aegic

let mapleader = ","
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
