set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'git@github.com:severin-lemaignan/vim-minimap.git'
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'git@github.com:terryma/vim-multiple-cursors.git'
Plugin 'git@github.com:nachumk/systemverilog.vim'
Plugin 'git@github.com:tweekmonster/braceless.vim'
Plugin 'git@github.com:dhruvasagar/vim-table-mode'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
colorscheme monokai
set expandtab        " Spaces not Tabs
set tabstop=4        " PEP8 Tabbing
set shiftwidth=4     " Tabbing
set cc=79            " PEP8 Line Limit (a good limit in general)
set nu               " Line numbers

"Keybinds
" TAB DEDENT for command mode
nnoremap <S-Tab> <<
" TAB DEDENT for insert mode
inoremap <S-Tab> <C-d>
" Toggle NERDTree
map <C-b> :NERDTreeToggle<CR>
" Clear trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
