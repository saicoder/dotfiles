" ================================== PLUGINS ==================================

call plug#begin('~/.config/nvim/plugged')

Plug 'sonph/onehalf', {'rtp': 'vim/'}
  let g:airline_theme='onehalfdark'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'
  map <C-n> :NERDTreeToggle<CR>
  let NERDTreeIgnore=['node_modules', '\.log$']

Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  set wildignore=.o,.obj,.git,node_modules,jspm_packages,deps

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><Up>  pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "\<Down>"

Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
  " FIX < stuck untill fix
  autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" js
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" html and markup
Plug 'slim-template/vim-slim'
Plug 'mattn/emmet-vim'
  let g:user_emmet_settings = { 'javascript.jsx': { 'extends': 'jsx', }, }
Plug 'alvan/vim-closetag'
  let g:closetag_filenames = '*.xhtml,*.html,*.jsx,*.js'



call plug#end()


" ================================= CONFIG ====================================

" Basic
set number
set nobackup nowritebackup

" Writing, Hightlight search, backspace bug fix
set hlsearch expandtab softtabstop=2 shiftwidth=2 backspace=2 smartindent 
let mapleader=" "

" Theme
set title
set termguicolors
set background=dark
colorscheme onehalfdark

" Sytntax
syntax on
au BufNewFile,BufRead *.ejs set filetype=html

" Undo 
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


" Custom mappings
noremap <Leader>e :CtrlPBuffer<CR>
noremap <Leader>w :w<CR>
noremap <Leader>q :wq<CR>
noremap <Leader>r :reg<CR>
noremap <Leader>l :b#<CR>
noremap <Leader>p "*p
vnoremap <Leader>y "*y
:nmap <C-s> :w<CR>
:imap <C-s> <Esc>:w<CR>a

