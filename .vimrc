set nocompatible
" be iMproved
set backspace=indent,eol,start
set background=dark
colorscheme solarized

let mapleader=","

"禁止光标闪烁
set gcr=a:block-blinkon0
"禁止显示滚动条
set guioptions-=1
set guioptions-=L
set guioptions-=r
set guioptions-=R
"禁止显示菜单和工具栏 
set guioptions-=m
set guioptions-=T
"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"开启行号显示
set number
"高亮显示当前行列
set cursorline
set cursorcolumn
"高亮显示搜索结果
set hlsearch
"设置显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
"禁止折行
set nowrap
"开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
"将制表符扩展为空格
"set expandtab
"设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用的空格数
set shiftwidth=4
"让vim把连续数量的空格视为一个制表符
set softtabstop=4
"基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
"启动vim关闭折叠代码
set nofoldenable


"
"
"
"插件
"设定主题栏风格
	let g:Powerline_colorscheme='solarized256'


"indent Guides 的设置
	"随vim自启动
	let g:indent_guides_enable_on_vim_startup=1
	"从第二层开始可视化缩进
	let g:indent_guides_start_level=2
	"色块宽度
	let g:indent_guides_guide_size=1
	"快捷键i开/关缩进可视化
	:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"ycm 
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py '
    let g:ycm_error_symbol = '>>'
    let g:ycm_warning_symbol = '>*'
    let g:ycm_complete_in_comments=1 "in the comment ,you also can use this
	" avoid conflict with Ultisnips about <tab>
	let g:ycm_key_list_select_completion = ['C-n', '<Down>']
	let g:ycm_key_list_previous_completion =['C-p', '<Up>']
    "goto defination and in another screen
	let g:ycm_goto_buffer_command='horizontal-split'
	nnoremap <leader>gf :YcmCompleter GoToDeFinition<CR>
	nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
	"nnoremap <leader>gf :YcmCompleter GoTo<CR>
	"nnoremap <leader>gf :YcmCompleter GoToDefinitionElseDeclaration<CR>
	
    
" Tagbar
    "let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    let g:tagbar_left = 1
    let g:tagbar_expand = 1
    let g:tagbar_compact = 1
    let g:tagbar_singleclick = 1
    let g:tagbar_autoshowtag = 1
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_width = 30
    autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.html,*.css,*.* call tagbar#autoopen()

"NERDtree
    map <leader>n :NERDTreeToggle<CR>
    let NERDTreeWinPos="right"
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "let NERDTreeDirArrows=0
    "let g:netrw_home='~/bak' 
    autocmd VimEnter *  NERDTree
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    "" s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'

"Wildfire 快速选择 默认Enter 和Backspase
    "nmap <SPACE> <Plug>(wildfire-fuel)
    "nmap <C-SPACE> <Plug>(wildfire-water)
    " 不习惯的默认的话，可以改这两个
    "let g:wildfire_objects = {
    "        \ "*" : ["i'", "i"", "i]", "i)", "i}"]
    "        \ }
    " cal wildfire#triggers#Add("<ENTER>", {
    "         \ "html,xml" : ["at", "it"]
    "         \ })         

"EasyMoytion
    map <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    nmap s <Plug>(esaymotion-overwin-f2)

"Syntastic
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list=1
	let g:syntastic_auto_loc_list=1
	let g:syntastic_check_on_open=1
	let g:syntastic_check_on_wq=0
	let g:syntastic_enable_highlighting=0

"NERDCommenter
	"<leader>cc 注释选中部分，每一行用一个
	"<leader>cn	
	"<leader>cm 对选中的区域注释，之用一个
	"<leader>c<SPACE>
	"<leader>cs  添加好看的注释
	"<leader>c$ 注释当前到光标的内容
	"<leader>ca 转换注释的方式
	"<leader>cl cb  左对其 右对其 左右针对/**/
	"<leader>cu 取消注释

"UltiSnipes
	let g:UltiSnipsExpandTrigger	=  "<tab>"
	let g:UltiSnipsJumpForwardTrigger='<C-j>'
	let g:UltiSnipsJumpBackwardTrigger='<C-k>'
	let g:UltiSnipsEditSplit="horizontal"

"vim-fugitive

"vim-surround
	"cs-change surround 
		" cs"'   把双引号变为单引号 
		" cs"<q> 把双引号变为<q></q>的形式
		" cst"  t可能代指<q>的这种形式，将其变为"
	"ds-delete surround
		"ds" 删除围绕的"
		"ds(  ds) 都是删除括号
	"ysiw-a word  此时光标在某个单词上
		"ysiw 后面接" (  [ 等，也可以接} ] ) 后面} 和{ 效果不同，
		" {紧致的贴在单词周围,而}是还加一个空格
	"yss-wholeline
		"yss " ( ) [ ] 之类的 
		"注: yssb 默认为加()







filetype on                 " required!
filetype plugin on
"自适应不同语言的智能缩进
filetype indent on


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
 
" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
 
filetype plugin indent on     " required!
"Ch

 

"General{
    Bundle 'winmanager'
    Bundle 'scrooloose/nerdtree'
    Bundle 'jiangmiao/auto-pairs'
	Bundle 'fholgado/minibufexpl.vim'
	Bundle 'tpope/vim-surround'
    "Bundle 'easymotion/vim-easymotion'
    "Bundle 'gcmt/wildfire.vim'
"}

"General Programing{
    Bundle 'scrooloose/syntastic'
	"与git有关，可以现在不看
    Bundle 'tpope/vim-fugitive'
	Bundle 'scrooloose/nerdcommenter'
	Bundle 'godlygeek/tabular'
    "Bundle 'majutsushi/tagbar'
    
"}
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'kshenoy/vim-signature'
    "书签可视化，但注意标签功能是vim提供的
    Bundle 'majutsushi/tagbar'   
    "左边的标签
    "{
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    "}

"HTML {
    "this is a plugin with which you can autoclosetag 
    Bundle 'amirh/HTML-AutoCloseTag'
    Bundle 'hail2u/vim-css3-syntax'
      "this is a plugin can show the color
    Bundle 'gorodinskiy/vim-coloresque'
    Bundle 'tpope/vim-haml'
    "this is a plugin with which you can write something quickly
    Bundle 'mattn/emmet-vim' 
"}

"Python{
	Bundle 'klen/python-mode'
	Bundle 'yssource/python.vim'
	Bundle 'python_match.vim'
	Bundle 'pythoncomplete'
"}
