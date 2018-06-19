call plug#begin('~/.vim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'Raimondi/delimitMate'
  Plug 'mattn/emmet-vim'
  Plug 'Chiel92/vim-autoformat'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-surround'
  Plug 'neovimhaskell/haskell-vim'
  Plug 'vim-scripts/tComment'
  Plug 'JulesWang/css.vim'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'itchyny/lightline.vim'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'christoomey/vim-tmux-navigator'

call plug#end()

set background=dark
colorscheme gruvbox

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " always display the status line
set noswapfile    " dont create useless swapfiles
set number        " show numbers

" shofttabs, two spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" make it obvious where 80 chracter is
set textwidth=80
set colorcolumn=+1
set wrap linebreak nolist

" show extra spaces
set list listchars=tab:¬ª¬∑,trail:¬∑,nbsp:¬∑

" Force to use hjkl
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Use minimal on gui
if has('gui_running')
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
