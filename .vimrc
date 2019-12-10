call plug#begin('~/.vim/plugged')

	Plug 'morhetz/gruvbox'
	Plug 'joshdick/onedark.vim'
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
	Plug 'w0rp/ale'
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'godlygeek/tabular'
	Plug 'tpope/vim-fugitive'
	Plug 'rking/ag.vim'
	Plug 'skwp/greplace.vim'

call plug#end()

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" use utf-8
set encoding=UTF-8

" colorscheme
set background=dark
colorscheme gruvbox

" interface
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " always display the status line
set noswapfile    " dont create useless swapfiles
set showtabline=2 " always show tab

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

" use tabs
set noexpandtab
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

let g:indent_guides_enable_on_vim_startup = 1

" make it obvious where 80 chracter is
set textwidth=80
set colorcolumn=+1
" set wrap linebreak nolist

" show extra spaces
set list listchars=tab:»·,trail:·,nbsp:·
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" enable mouse support
set mouse=a

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

" use tree view on explore
let g:netrw_liststyle = 3

" greplace for ag.vim
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" ctrlp ignore files
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

" ctrlp show hidden files
let g:ctrlp_show_hidden = 1
" let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'

let mapleader = "\<Space>"

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

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

" save
nmap <leader>w :w<cr>

" quit
nmap <leader>q :q<cr>

" clear search highlighting
nmap <leader>n :noh<cr>

" split vertical
nmap <leader>vsp :vsplit<cr>:e .<cr>

" git gutter line highligts
nmap <leader>diff :GitGutterLineNrHighlightsToggle<cr>:GitGutterLineHighlightsToggle<cr>

" run plug install
nmap <leader>PI :source ~/.vimrc<cr>:PlugInstall<cr>

" ctrlp shorcuts
nmap <c-R> :CtrlPBufTag<cr>
nmap <c-O> :CtrlPMRUFiles<cr>

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

