set nocp

" 定义快捷键的前缀，即 <Leader>
let mapleader=";" 

"配置相关删除和左右相关
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


" 定义快捷键到行首和行尾
nmap lb 0
nmap le $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

"设置F2为取消高亮
nmap <F2> :nohlsearch<CR>

"设置<leader>ev为打开设置
nnoremap <Leader>ev  :vsplit  $MYVIMRC<CR>
nnoremap <Leader>sv  :source $MYVIMRC<CR> 

"设置当前路径为当前文件路径
autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /

" 光标移动到buffer的顶部和底部时保持3行距离
 set scrolloff=3

"# 将 pathogen 自身也置于独立目录中，需指定其路径
runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
execute pathogen#infect()
call pathogen#helptags()
" 配色方案
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T 

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 设置 gvim 显示字体
set guifont=YaHei_Consolas_Hybrid:h12

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

"显示CMD
set showcmd

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>

" 正向遍历同名标签
 nmap <Leader>tn :tnext<CR>
" " 反向遍历同名标签
 nmap <Leader>tp :tprevious<CR>


 " 设置插件 indexer 调用 ctags 的参数
 " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
 " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

 " 设置 tagbar 子窗口的位置出现在主编辑区的左边 
 let tagbar_left=1 
 " 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
 nnoremap <Leader>tl :TagbarToggle<CR> 
 " 设置标签子窗口的宽度 
 let tagbar_width=32 
 " tagbar 子窗口中不显示冗余帮助信息 
 let g:tagbar_compact=1
 " 设置 ctags 对哪些代码元素生成标签
 let g:tagbar_type_cpp = {
     \ 'kinds' : [
         \ 'd:macros:1',
         \ 'g:enums',
         \ 't:typedefs:0:0',
         \ 'e:enumerators:0:0',
         \ 'n:namespaces',
         \ 'c:classes',
         \ 's:structs',
         \ 'u:unions',
         \ 'f:functions',
         \ 'm:members:0:0',
         \ 'v:global:0:0',
         \ 'x:external:0:0',
         \ 'l:local:0:0'
      \ ],
      \ 'sro'        : '::',
      \ 'kind2scope' : {
          \ 'g' : 'enum',
          \ 'n' : 'namespace',
          \ 'c' : 'class',
          \ 's' : 'struct',
          \ 'u' : 'union'
      \ },
      \ 'scope2kind' : {
          \ 'enum'      : 'g',
          \ 'namespace' : 'n',
          \ 'class'     : 'c',
          \ 'struct'    : 's',
          \ 'union'     : 'u'
      \ }
      \ }
"let g:tagbar_ctags_bin='D:\vim\vim74\ctags.exe'

 " UltiSnips 的 tab 键与 YCM 冲突，重新设定
 "let g:UltiSnipsExpandTrigger="<Leader><tab>"    
 "let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
 "let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"
 let g:UltiSnipsSnippetDirectories=["mysnippets"] 


"-------------------------
"
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900



" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
