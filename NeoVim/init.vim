call plug#begin('~/.config/nvim/plug')
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'sheerun/vim-polyglot'
Plug 'whatyouhide/vim-gotham'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set hidden
set laststatus=2
set nobackup
set noshowmode
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set termguicolors
set background=dark

colors gotham

" Mappings
map <C-n> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>
inoremap <silent><expr> <c-space> coc#refresh()

" Plugin settings
" lightline
let g:lightline = { 'colorscheme': 'gotham' }

" vim-go
let g:go_fmt_command = "goimports"

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
