set nu
let mapleader = "," 
"syntax on
set backspace=indent,eol,start
set viminfo='10,\"100,:20,%,n~/.viminfo 
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


set tags=/server/tags

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin	'sickill/vim-monokai',{'name': 'vim-monokai'}
Plugin 'tomasr/molokai', {'name': 'tomasr_molokai'}
syntax enable
colorscheme monokai
"colorscheme molokai

Plugin 'vim-airline/vim-airline'
set laststatus=2
Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='simple'
"let g:airline_theme='tomorrow'

"Plugin 'ctrlpvim/ctrlp.vim',{'name':	'ctrlpvim_ctrlp.vim'}



" Define bundles via Github repos
Bundle 'taglist.vim'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim

cs add /server/cscope.out /server
set cscopequickfix=s-,c-,d-,i-,t-,e-


if has("cscope")

    set cscopetag

    set csto=0

    if filereadable("cscope.out")
        cs add cscope.out  
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  



    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	



    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	



    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif


Plugin 'vim-scripts/winmanager' "vim 目录树插件 集成了 Tlist ,NERDTreeToggle
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>


Plugin 'EasyGrep'	"vim Grep 插件

Plugin 'Shougo/neocomplete.vim' "智能补全插件

Plugin 'tacahiroy/ctrlp-funky' "显示 文件函数插件  <leader>fu
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


Plugin	'kien/ctrlp.vim'	"快速搜索文件插件

Plugin	'msanders/snipmate.vim'	"自动补全
Plugin 'garbas/vim-snipmate'	"自动补全
Plugin 'MarcWeber/vim-addon-mw-utils'	"markdown
Plugin 'tomtom/tlib_vim'	"vim markdown 语法高亮

Plugin 'scrooloose/syntastic'	"语法检查擦肩

Plugin 'slim-template/vim-slim'	"语法高亮插件

Plugin 'tpope/vim-fugitive'	" git vim 插件	

Plugin 'tpope/vim-surround'	" 环绕删除

"Plugin 'vim-scripts/ctags.vim'

Plugin 'vim-scripts/matchit.zip' "自定义 跳转插件 vim 的 ％

Plugin 'vim-scripts/tComment'	"快速添加 注释 插件

"Plugin "mattn/emmet-vim"	"快速创建html 元素

Plugin 'scrooloose/nerdtree'

"Plugin "Lokaltog/vim-powerline"	"状态兰插件

Plugin 'godlygeek/tabular' "对齐插件 用于 Vim 中按等号、冒号、表格等来对齐文本

"Plugin "jelera/vim-javascript-syntax"  "js 语法检查插件

"Plugin 'altercation/vim-colors-solarized' "修改 vim 主题颜色 插件
"syntax enable
"set background=light
"colorscheme solarized

Plugin 'othree/html5.vim'	"html5 语法高亮插件

Plugin 'Raimondi/delimitMate'	"符号自动补 自动补全引号(单引号/双引号/反引号), 括号(()[]{}))

"Plugin 'groenewege/vim-less'	"vim less 语法高亮插件

"Plugin 'evanmiller/nginx-vim-syntax' "nginx vim 语法高亮插件

Plugin 'Lokaltog/vim-easymotion' "快速跳转插件

call vundle#end()            " required
filetype plugin on    " required
filetype indent off   " required
