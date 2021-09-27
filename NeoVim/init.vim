call plug#begin('~/.config/nvim/plug')

" Git related plugins
Plug 'airblade/vim-gitgutter'

" Code completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'dart-lang/dart-vim-plugin'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'

" Code formatting
Plug 'preservim/nerdcommenter'
Plug 'kevinoid/vim-jsonc'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Code building
Plug 'cdelledonne/vim-cmake'

" Debugging
Plug 'puremourning/vimspector'

" Syntax files
Plug 'sheerun/vim-polyglot'

" Eye candy
"Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Editor settings
Plug 'junegunn/goyo.vim'
Plug 'editorconfig/editorconfig-vim'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

set background=dark
set expandtab
set hidden
set nobackup
set noshowmode
set noswapfile
set nowrap
set nowritebackup
set number
set wildmenu

set clipboard+=unnamedplus
set inccommand=nosplit
set path=$PWD/**
set shiftwidth=4
set signcolumn=yes
set tabstop=4
set termguicolors
set updatetime=300

colorscheme onedark

filetype plugin on
filetype indent on

" Mappings
let mapleader=","

nnoremap j jzz
nnoremap k kzz
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

nmap <F5> :Make<CR>
nmap <silent> <C-k> :call <SID>show_documentation()<CR>

" VSCode mappings stolen because of habbit
nmap <silent> <C-s> :w<CR>
nmap <silent> <M-S-f> :Format<CR>

" coc code navigation and other features
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

" Use <CR> to confirm the selected complete option
if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

let &fcs='eob: '

" Plugin settings

" Goyo
let g:goyo_linenr = 1
let g:goyo_width = -40+120

" coc.nvim extensions
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-angular', 'coc-flutter', 'coc-rls', 'coc-python', 'coc-omnisharp', 'coc-snippets', 'coc-eslint', 'coc-yaml', 'coc-deno']

" airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" gitgutter
let g:gitgutter_git_executable = '/bin/git'
let g:gitgutter_sign_added = '｜'
let g:gitgutter_sign_modified = '｜'
let g:gitgutter_sign_removed = '｜'
let g:gitguttef_sign_removed_first_line = '｜'
let g:gitgutter_sign_modified_removed = '｜'

" IndentLine
let g:indentLine_char = '｜'
let g:indentLine_first_char = '｜'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" NERDTree
let g:NERDTreeWinSize=48
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

" Custom commands
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=* Make make <args> | cwindow 3
" Source: https://www.reddit.com/r/neovim/comments/bgx2f2/how_to_run_a_terminal_command_in_background_of/elpokeb?utm_source=share&utm_medium=web2x&context=3
command! -nargs=1 StartAsync
         \ call jobstart(<f-args>, {
         \    'on_exit': { j,d,e ->
         \       execute('echom "command finished with exit status '.d.'"', '')
         \    }
         \ })

augroup Loading
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

augroup BufferModifications
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup FileTypeMakeprgSettings
   autocmd!
   autocmd FileType c setlocal makeprg=make\ &&\ make\ run
   autocmd FileType cs setlocal makeprg=dotnet\ run
   autocmd FileType cpp setlocal makeprg=make\ &&\ make\ run
   autocmd FileType go setlocal makeprg=go\ build\ %\ &&\ go\ run\ %
   autocmd FileType rust setlocal makeprg=cargo\ run %
   autocmd FileType python setlocal makeprg=python\ %
augroup END

" show_documentation function for coc.nvim
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
