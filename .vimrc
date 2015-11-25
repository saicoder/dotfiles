execute pathogen#infect()

" Basic
set number
set nobackup nowritebackup

" Writing
set tabstop=3 hlsearch softtabstop=0 expandtab shiftwidth=3 smarttab backspace=2 rnu smartindent 
let mapleader=";"


" Theme
set background=dark
colorscheme base16-default
syntax on

if has("gui_running")
  set guifont=Source\ Code\ Pro\ for\ Powerline:h12 
  "let base16colorspace=256  " Access colors present in 256 colorspace
endif


" JSX
let g:jsx_ext_required = 0  " JSX on in js files

 " ctrlp.vim fuzzy finder 
set wildignore=.o,.obj,.git,node_modules,jspm_packages
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" Powerline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERD TREE
map <C-n> :NERDTreeToggle<CR>


