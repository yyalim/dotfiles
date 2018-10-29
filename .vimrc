call plug#begin('~/.vim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'Raimondi/delimitMate'
  Plug 'mattn/emmet-vim'
  Plug 'vim-scripts/tComment'
  Plug 'JulesWang/css.vim'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-surround'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/goyo.vim'
  Plug 'elmcast/elm-vim'
  Plug 'tpope/vim-repeat'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
  Plug 'w0rp/ale'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

call plug#end()

set background=dark
colorscheme gruvbox

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " always display the status line
set noswapfile    " dont create useless swapfiles

" Use search highlighting
set incsearch
set ignorecase
set hlsearch

" uses hybrid line number on focused pane
" normal line numbers on unfocused paneS
set number relativenumber

" use hybrid line number on active window
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" use line highlighting on active window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

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
set list listchars=tab:»·,trail:·,nbsp:·


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

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" quick switch to normal mode
imap jj <esc>

" Force to use hjkl
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let mapleader = "\<Space>"

"C Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :vsp ~/.vimrc<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source ~/.vimrc<cr>

" paste from clipboard 
nmap <leader>p "+p 
vmap <leader>p "+p
" yank into clipboard 
vmap <leader>y "+y 
" cut into clipboard
nmap <leader>d "+d
vmap <leader>d "+d
" Copy the entire buffer into the system register
nmap <leader>co ggVG"+y

" make new line and back to normal mode
nmap <leader>o o<esc>
nmap <leader>O O<esc>

" open fuzzyfinder
nmap <leader>t :GFiles<cr>
nmap <leader>T :Files<cr>
nmap <leader>t! :e!<cr>:GFiles<cr>
nmap <leader>T! :e!<cr>:Files<cr>

" save
nmap <leader>w :w<cr>

" quit
nmap <leader>q :q<cr>

" clear search highlighting
nmap <leader>n :noh<cr>

" split vertical
nmap <leader>vsp :vsplit<cr>:e .<cr>
nmap <leader>vspt :vsplit<cr>:GFiles<cr>

