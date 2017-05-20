"�Ƿ����VI��compatibleΪ���ݣ�nocompatibleΪ����ȫ����
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
"�����������ģʽΪWINDOWSģʽ
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

"����˵�����
set encoding=utf-8
"fileencodings��Ҫע��˳��ǰ����ַ���Ӧ�ñȺ�����ַ�����
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"���consle�������
language messages zh_CN.utf-8

"�﷨����
syntax on

"�Զ�����
set autoindent
"���� Backspace �� Delete �����̶ȣ�backspace=2 ��û���κ�����
"��������Щģʽ��ʹ����깦�ܣ�mouse=a ��ʾ����ģʽ
set mouse=a
set backspace=2
"���Զ�����
set nowrap
"���ó���100�ַ��Զ�����
"set textwidth=100
"���ó���100�е��ַ����»���
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>100v.\+', -1)
"syn match out80 /\%80v./ containedin=ALL
"hi out80 guifg=white guibg=red
"���ܶ��뷽ʽ
set smartindent
"һ��tab��4���ַ�
set tabstop=4
"��һ��tabǰ��4���ַ�
set softtabstop=4
"�ÿո����tab
set expandtab
"�����Զ�����
set ai!
"�������ַ�����
set cindent shiftwidth=4
"set autoindent shiftwidth=2

"�����۵�ģʽ
set foldcolumn=4
"��������۵����۵��ʹ�
"set foldopen=all
"�ƿ��۵�ʱ�Զ��ر��۵�
"set foldclose=all
"zf zo zc zd zr zm zR zM zn zi zN
"�������۵�
" manual �ֹ������۵�
" indent �����������ʾ���߼�����۵�
" expr �ñ��ʽ�������۵�
" syntax ���﷨�����������۵�
" diff ��û�и��ĵ��ı������۵�
" marker �����еı�־�۵�
set foldmethod=syntax
"����ʱ��Ҫ�Զ��۵�����
set foldlevel=100
"������۵�
set foldmethod=marker

"��ʾ�к�
set number

"�򿪹�������λ����ʾ����
set ruler

"��ʾ��������
set ambiwidth=double

"�и���
set cursorline
"�и������뺯���б��г�ͻ
set cursorcolumn

"���������еĸ߶�
set cmdheight=2

"���������Ĺؼ���
set hlsearch

"�������Դ�Сд
set ignorecase

"����������ʷ����
set history=100

"������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ
set shortmess=atI

"��Ҫ��˸
set novisualbell

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T

"��ʾTAB��
set list
set listchars=tab:>-,trail:-

"�����ַ������䲻��100������
":highlight OverLength ctermbg=red ctermfg=white guibg=grey guifg=white
":match OverLength '\%101v.*'

"����VIM״̬��
set laststatus=2 "��ʾ״̬��(Ĭ��ֵΪ1, �޷���ʾ״̬��)
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
"״̬����ɫ
"highlight StatusLine guifg=SlateBlue guibg=Yellow
"highlight StatusLineNC guifg=Gray guibg=White


"ȥ���й�viһ����ģʽ��������ǰ�汾��һЩbug�;���
set nocp

"��ǿģʽ�е��������Զ���ɲ���
set wildmenu

"ȱʡ�����������ļ�
set nobackup
"����������ʱ������ݵ�������֮��ƥ������Ŵ�����Ӱ������
set showmatch
"��ȷ�ش��������ַ������к�ƴ��
set formatoptions+=mM

"�趨�ļ������Ŀ¼Ϊ��ǰĿ¼
set bsdir=buffer
"�Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set autochdir
"�Զ����¼����ⲿ�޸�����
"set autoread

"��������δ������޸�ʱ�л�������
set hidden

"ѡ��һ�����ֲ�ȫ�������������
vmap ,/ y/=escape(@", '\\/.*$^~[]')
vmap ,? y?=escape(@", '\\/.*$^~[]')

"���뵱ǰ�༭���ļ���Ŀ¼
autocmd BufEnter * exec "cd %:p:h"

"�����ļ��ĸ�ʽ˳��
set fileformats=dos,unix

"��ɫ���������ɫ��colorsĿ¼��http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/index-c.html��
colorscheme solarized

"��������
if has("gui")
    if has("win32")
        "WindowsĬ��ʹ�õ����壬����ϴ�
        set guifont=Fixedsys
    else
        set guifont=SimSun:h10
    endif
    "set columns=128 lines=36
endif

"���������
au GUIEnter * simalt ~x

"��ճ��ģʽ������ճ�������ĳ������Ͳ����λ�ˡ�
"set paste

"���ð�����Ϣ
set helplang=cn

"�Զ�����session��viminfo
"ȱʡ��sessionoptionsѡ�������blank,buffers,curdir,folds,help,options,tabpages,winsize
"Ҳ���ǻỰ�ļ���ָ���ǰ�༭�����Ŀմ��ڡ����еĻ���������ǰĿ¼���۵�(fold)��ص���Ϣ���������ڡ����е�ѡ���ӳ�䡢���еı�ǩҳ(tab)�����ڴ�С
"set sessionoptions-=curd 

au BufNewFile,BufRead *.py set fileencoding=utf-8
au BufNewFile,BufRead *.lua set fileencoding=utf-8
"""""���ļ�����""""""""""
"�½�.sh,.java�ļ����Զ������ļ�ͷ
autocmd BufNewFile *.lua,*.py exec ":call SetTitle()"
""���庯��SetTitle���Զ������ļ�ͷ
func SetTitle()
    "����ļ�����Ϊ.sh�ļ�
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
"�½��ļ����Զ���λ���ļ�ĩβ
autocmd BufNewFile * normal G

"racer ����
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
