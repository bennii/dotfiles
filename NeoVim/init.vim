call plug#begin('~/.config/nvim/plug')

" Git related plugins
Plug 'airblade/vim-gitgutter'

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
set nowrap
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

" gitgutter
let g:gitgutter_git_executable = '/bin/git'
let g:gitgutter_sign_added = '❚'
let g:gitgutter_sign_modified = '❚'
let g:gitgutter_sign_removed = '❚'
let g:gitguttef_sign_removed_first_line = '❚'
let g:gitgutter_sign_modified_removed = '❚'


" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Return to last cursor position after revisiting a file
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

autocmd BufEnter * :normal zz
