set number " show line numbers
set clipboard=unnamedplus
set incsearch
set diffopt+=vertical " Show diffs side by side
set nowrap

set encoding=utf-8

" clipboard
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

" syntax highlighting
let python_highlight_all=1
syntax on

"for a misbehaved Backspace key from an external keyboard. Doesn't quite fix the problem though.
nnoremap <BS> <Left><Del>
inoremap <BS> <Left><Del>
set backspace=indent,eol,start

"Show a tree to navigate and open files
set wildmenu

" specify where the split should happen
set splitright

" adds PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" YouCompleteMe customizations
let g:ycm_autoclose_preview_window_after_completion=1
map <leager>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python with virtualenv support. Adds support to virtualenv
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" setting up vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'sainnhe/gruvbox-material'
Plugin 'sheerun/vim-polyglot'
Plugin 'sainnhe/edge'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configs
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Powerline configs
set laststatus=2 " always display powerline

" colorscheme
colorscheme edge
set background=dark

filetype indent on
" netrw
"let g:netrw_liststyle = 3 " tree view for directory browser
"let g:netrw_browse_split = 4 " open in previous window
"let g:netrw_winsize = 20 " width of the directory finder
"let g:netrw_altv = 1 " contrl left/right something
"let g:netrw_fastbrowse = 0 " get rid of pesky bug that doesnt allow you to close buffers
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END
set whichwrap+=<,>,h,l


set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
