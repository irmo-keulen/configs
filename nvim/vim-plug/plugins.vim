" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    "Theme
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'joshdick/onedark.vim'
	"Syntax Support
	Plug 'sheerun/vim-polyglot'
	" Auto Pair
	Plug 'jiangmiao/auto-pairs'
    " Auto complete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Go-Support
    
call plug#end()
