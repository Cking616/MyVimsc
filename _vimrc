"是否兼容VI，compatible为兼容，nocompatible为不完全兼容
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+="C:\Program Files\Vim\vimfiles\autoload\vundle.vim"
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'supertab'
Plugin 'a.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cespare/vim-toml'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'vim-misc'
Plugin 'Shougo/neocomplete.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required   

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
"设置鼠标运行模式为WINDOWS模式
behave mswin

" Multi-encoding setting, MUST BE IN THE BEGINNING OF .vimrc!
"
if has("multi_byte")
    " When 'fileencodings' starts with 'ucs-bom', don't do this manually
    "set bomb
    set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
    " CJK environment detection and corresponding setting
    if v:lang =~ "^zh_CN"
        " Simplified Chinese, on Unix euc-cn, on MS-Windows cp936
        set encoding=chinese
        set termencoding=chinese
        if &fileencoding == ''
            set fileencoding=chinese
        endif
    elseif v:lang =~ "^zh_TW"
        " Traditional Chinese, on Unix euc-tw, on MS-Windows cp950
        set encoding=taiwan
        set termencoding=taiwan
        if &fileencoding == ''
            set fileencoding=taiwan
        endif
    elseif v:lang =~ "^ja_JP"
        " Japanese, on Unix euc-jp, on MS-Windows cp932
        set encoding=japan
        set termencoding=japan
        if &fileencoding == ''
            set fileencoding=japan
        endif
    elseif v:lang =~ "^ko"
        " Korean on Unix euc-kr, on MS-Windows cp949
        set encoding=korea
        set termencoding=korea
        if &fileencoding == ''
            set fileencoding=korea
        endif
    endif
    " Detect UTF-8 locale, and override CJK setting if needed
    if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
    endif
else
    echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"'
endif

"解决菜单乱码
set encoding=utf-8
"fileencodings需要注意顺序，前面的字符集应该比后面的字符集大
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.utf-8

"语法高亮
syntax on

"自动缩进
set autoindent
"设置 Backspace 和 Delete 的灵活程度，backspace=2 则没有任何限制
"设置在哪些模式下使用鼠标功能，mouse=a 表示所有模式
set mouse=a
set backspace=2
"不自动换行
set nowrap
"设置超过100字符自动换行
"set textwidth=100
"设置超过100列的字符带下划线
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>100v.\+', -1)
"syn match out80 /\%80v./ containedin=ALL
"hi out80 guifg=white guibg=red
"智能对齐方式
set smartindent
"一个tab是4个字符
set tabstop=4
"按一次tab前进4个字符
set softtabstop=4
"用空格代替tab
set expandtab
"设置自动缩进
set ai!
"缩进的字符个数
set cindent shiftwidth=4
"set autoindent shiftwidth=2

"设置折叠模式
set foldcolumn=4
"光标遇到折叠，折叠就打开
"set foldopen=all
"移开折叠时自动关闭折叠
"set foldclose=all
"zf zo zc zd zr zm zR zM zn zi zN
"依缩进折叠
" manual 手工定义折叠
" indent 更多的缩进表示更高级别的折叠
" expr 用表达式来定义折叠
" syntax 用语法高亮来定义折叠
" diff 对没有更改的文本进行折叠
" marker 对文中的标志折叠
set foldmethod=syntax
"启动时不要自动折叠代码
set foldlevel=100
"依标记折叠
set foldmethod=marker

"显示行号
set number

"打开光标的行列位置显示功能
set ruler

"显示中文引号
set ambiwidth=double

"行高亮
set cursorline
"列高亮，与函数列表有冲突
set cursorcolumn

"设置命令行的高度
set cmdheight=2

"高亮搜索的关键字
set hlsearch

"搜索忽略大小写
set ignorecase

"设置命令历史行数
set history=100

"启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

"不要闪烁
set novisualbell

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T

"显示TAB健
set list
set listchars=tab:>-,trail:-

"高亮字符，让其不受100列限制
":highlight OverLength ctermbg=red ctermfg=white guibg=grey guifg=white
":match OverLength '\%101v.*'

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


"去掉有关vi一致性模式，避免以前版本的一些bug和局限
set nocp

"增强模式中的命令行自动完成操作
set wildmenu

"缺省不产生备份文件
set nobackup
"在输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
set showmatch
"正确地处理中文字符的折行和拼接
set formatoptions+=mM

"设定文件浏览器目录为当前目录
set bsdir=buffer
"自动切换当前目录为当前文件所在的目录
set autochdir
"自动重新加载外部修改内容
"set autoread

"允许在有未保存的修改时切换缓冲区
set hidden

"选中一段文字并全文搜索这段文字
vmap ,/ y/=escape(@", '\\/.*$^~[]')
vmap ,? y?=escape(@", '\\/.*$^~[]')

"进入当前编辑的文件的目录
autocmd BufEnter * exec "cd %:p:h"

"保存文件的格式顺序
set fileformats=dos,unix

"配色（更多的配色见colors目录和http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/index-c.html）
colorscheme solarized

"设置字体
if has("gui")
    if has("win32")
        "Windows默认使用的字体，字体较粗
        set guifont=Fixedsys
    else
        set guifont=SimSun:h10
    endif
    "set columns=128 lines=36
endif

"启动后最大化
au GUIEnter * simalt ~x

"置粘贴模式，这样粘贴过来的程序代码就不会错位了。
"set paste

"设置帮助信息
set helplang=cn

"自动保存session和viminfo
"缺省的sessionoptions选项包括：blank,buffers,curdir,folds,help,options,tabpages,winsize
"也就是会话文件会恢复当前编辑环境的空窗口、所有的缓冲区、当前目录、折叠(fold)相关的信息、帮助窗口、所有的选项和映射、所有的标签页(tab)、窗口大小
"set sessionoptions-=curd 

au BufNewFile,BufRead *.py set fileencoding=utf-8
au BufNewFile,BufRead *.lua set fileencoding=utf-8
"""""新文件标题""""""""""
"新建.sh,.java文件，自动插入文件头
autocmd BufNewFile *.lua,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'python'
        call setline(1,"# -*- coding:utf-8 -*-")
        call append(line("."), "# File Name: ".expand("%"))
        call append(line(".")+1, "# Author: kht")
        call append(line(".")+2, "# Created Time: ".strftime("%c"))
	else
		call setline(1,"-- coding:utf-8")
		call append(line("."), "-- File Name: ".expand("%"))
		call append(line(".")+1, "-- Author: kht")
		call append(line(".")+2, "-- Created Time: ".strftime("%c"))
    endif
endfunc
"""""""""""""""""""""""""""""""
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"racer 配置
let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
