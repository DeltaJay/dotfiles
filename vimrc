set nocompatible "Do not preserve Vi compatibility (Lose lots of nice features/plugins otherwise)


" Create a directory for all swp/backups/undos and turn those features on

if !isdirectory($HOME . "/.vim/directory/")
	call mkdir($HOME . "/.vim/directory/", "p", 0700)
endif

set swapfile
set directory=~/.vim/directory/

set backup
set backupdir=~/.vim/directory/

set undofile
set undodir=~/.vim/directory/

" Install plugin manager if not already
if empty(glob($HOME . '/.vim/autoload/plug.vim'))
	silent execute '! curl -fL --no-progress-meter -o' . $HOME . '/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin()

Plug 'tpope/vim-fugitive'	" Git integration, :help Git
Plug 'vimwiki/vimwiki'		" Vim note taking plugin

call plug#end()


set backspace=indent,eol,start " Allow backspacing over everythin in insert mode

set history=200			" Keep 200 lines of command line history
set ruler			" Show the cursor position at all times
set showcmd			" Display incomplete commands
set wildmenu			" Display completion matches in the status line

set ttimeout			" Time out for key codes
set ttimeoutlen=100		" Wait up to 100ms after Esc for special key

set display=truncate		" Show @@@ in the last line if it is truncated
set scrolloff=5			" Show a few lines of context around the cursor


set incsearch 			" Start searching the moment we start searching
set listchars=tab:<->,trail:-,extends:>,precedes:<,nbsp:+ " Show invisible characters

set number			" Always nice to know the line numbers

filetype plugin indent on
syntax on

set tabstop=4
set shiftwidth=4
