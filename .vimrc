set nocompatible    " required
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" add all plugins here:
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
" Add Plugins before the following

call vundle#end()
filetype plugin indent on

" for autocomplete:
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"project_base_dir = os.environ['VIRTUAL_ENV']
"activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"namespace = {"__file__":activate_this}
"with open(activate_this, 'rb') as file:
"exec(compile(file.read(), activate_this, 'exec'),
"namespace
")
"EOF

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set ruler
set number
set hidden
set showmatch
set fileformat=unix
set encoding=utf-8
set background=dark
set clipboard=unnamed

let python_highlight_all = 1

syntax on
syntax enable

colorscheme zenburn

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
