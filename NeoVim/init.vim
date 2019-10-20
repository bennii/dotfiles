call plug#begin('~/.config/nvim/plug')

" Code completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'lervag/vimtex'

" Syntax files
Plug 'sheerun/vim-polyglot'

" Eye candy
Plug 'whatyouhide/vim-gotham'
Plug 'itchyny/lightline.vim'

" Editor settings
Plug 'editorconfig/editorconfig-vim'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

set background=dark
set expandtab
set hidden
set laststatus=2
set nobackup
set noshowmode
set noswapfile
set nowritebackup
set number
set path=$PWD/**
set shiftwidth=4
set shortmess+=c
set signcolumn=yes
set tabstop=4
set termguicolors
set wildmenu

colors gotham
filetype plugin on
filetype indent on

" Mappings
" Normal mode
nnoremap j jzz
nnoremap k kzz
nnoremap <C-n> :NERDTreeToggle<CR>

" Insert mode
inoremap <silent><expr> <c-space> coc#refresh()

" Plugin settings
" lightline
let g:lightline = { 'colorscheme': 'gotham' }

" vim-go
let g:go_fmt_command = "goimports"

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Return to last cursor position after revisiting a file
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
