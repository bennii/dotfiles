" Plugins {{{
call plug#begin('~/.config/nvim/plug')
" Eye candy
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'NLKNguyen/papercolor-theme'

" File management
Plug 'kien/ctrlp.vim'       " replace with fzf?
Plug 'vim-scripts/a.vim'    " Change from .h to .c(pp)
Plug 'scrooloose/nerdtree'

" Text and code helper
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'

" CVS tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Latex
Plug 'lervag/vimtex'

" Syntax files
Plug 'HerringtonDarkholme/yats.vim'

" Autocompletion and linting
Plug 'fatih/vim-go'
Plug 'Shougo/neoinclude.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/deoplete-clangx'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

call plug#end()
" }}}

" Plugin settings {{{
" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_refresh_delay = 10
let g:deoplete#auto_complete_start_length = 1

" ALE settings
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" material color theme settings
let g:material_theme_style = 'dark'
let g:material_terminal_italics = 1

" vimtex settings
let g:vimtex_mappings_enabled = 0

" tagbar settings
let g:tagbar_sort = 1
let g:tagbar_indent = 2
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 0

" LanguageClient settings
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'javascript.jsx': ['javascript-typescript-stdio'],
            \ 'python': ['pyls'] }

" vim-airline settings
let g:airline_theme='material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" javacomplete2 settings
let g:JavaComplete_ClosingBrace = 1

" vim-go settings
" }}}

" autocmds/augroups {{{
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

    augroup LatexFeatures
        autocmd!
        autocmd filetype tex nnoremap <buffer> <F9> :VimtexCompile<Enter>
    augroup END

    augroup JavaFeatures
        autocmd!
        autocmd filetype java nnoremap <buffer> <F9> :!./run<Enter>
        autocmd filetype java setlocal smartindent
        autocmd FileType java setlocal omnifunc=javacomplete#Complete
    augroup END

    augroup MarkdownFeatures
        autocmd!
        autocmd filetype markdown setlocal wrap
    augroup END

    augroup PythonFeatures
        autocmd!
        autocmd BufWrite *.py :call DeleteTrailingWS()
        autocmd filetype python nnoremap <buffer> <F9> :!python %<Enter>
    augroup END

    augroup JavascriptFeatures
        autocmd!
        autocmd filetype javascript nnoremap <buffer> <F9> :!node %<Enter>
    augroup END

    augroup GolangFeatures
        autocmd!
        autocmd filetype go nnoremap <buffer> <F9> :GoRun %<Enter>
        autocmd filetype go nnoremap <buffer> <F10> :GoBuild!<Enter>
        autocmd filetype go nnoremap <buffer> <C-g>i :GoImport
        autocmd filetype go nnoremap <buffer> <C-g>d :GoDrop
        autocmd filetype go nnoremap <buffer> <C-g>g :GoDef<Enter>
        autocmd filetype go nnoremap <buffer> <C-g>s :GoInfo<Enter>
        autocmd filetype go nnoremap <buffer> <C-g>r :GoRename!<Enter>
endif
" setlocal has to be here in order to trigger for a new buffer
" }}}

" Settings {{{
set hidden                      " Allow buffers to be hidden after a modification
set magic 					    " For regular expressions turn magic on
set number                      " Enable line numbers
set relativenumber              " Enable relative line numbers
set nowrap                      " Turning off line wraps, there is a toggle keybind for it in this vimrc
set autoread 				    " Set to auto read when a file is changed from the outside
set lazyredraw                  " Do not redraw when executing macros. Performance boosts.
set termguicolors               " Enable GUI colors in Terminal. Requires terminal with true colors enabled
set autoindent                  " Enable auto indentation
set incsearch  				    " Makes search act like search in modern browsers, searching while typing. Reduces performance.
set ignorecase                  " Ignore case matching during search (has to be on for smartcase)
set smartcase                   " But if there is a search with upper case, search for upper cases
set showmatch 				    " Show matching brackets when text indicator is over them
set noshowmode 				    " Hide default mode indicator
set noerrorbells 			    " No annoying sound on errors
set novisualbell                " Disable visual effects on errors
set nobackup                    " Do not make a backup before overwriting a file
set noswapfile                  " Do not use a swap file. Save some of my SSD life
set nowritebackup               " Do not use backups before writing a file. Saves my SSD lifetime. I save a file every change anyway.
set smarttab                    " Be smart when using tabs
set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " 1 tab = 4 spaces
set shiftwidth=4                " 1 tab == 4 spaces
set wildmenu 				    " Turn on the wild menu
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set background=dark             " Load the dark background of colorschemes
set signcolumn=yes               " Always show signcolumn
set spelllang=de_de             " I am german
set colorcolumn=0               " Disable colorcolumn
set fileformats=unix,dos,mac    " Use Unix as the standard file type
set whichwrap+=<,>,h,l          " Additional keys to move between lines
set fillchars=vert:\│           " Better looking UTF characters
set foldmethod=marker           " Use {{{,}}} to define folding areas
set completeopt-=preview        " Disable preview window during completion
set clipboard+=unnamedplus      " Disable registers and always use the clipboard to copy/paste
set backspace=eol,start,indent  " Configure backspace so it acts as it should act

syntax enable
filetype plugin on
filetype indent on
colorscheme material
" }}}

" Variables {{{
let mapleader=","
" }}}

" Mappings {{{
nnoremap j gjzz
nnoremap k gkzz
nnoremap ds{ F{xf}x
nnoremap cs{ F{xf}xi
nnoremap ds" F"x,x
nnoremap cs" F"x,xi
nnoremap ds' F'x,x
nnoremap cs' F'x,xi
nnoremap ds( F(xf)x
nnoremap cs( F(xf)xi
nnoremap ds) F(xf)x
nnoremap cs) F(xf)xi
nnoremap <space> /
nnoremap Q <Nop>
nnoremap <M-right> :bn<Enter>
nnoremap <M-left> :bp<Enter>
nnoremap <M-n>bn :new<Enter>
nnoremap <M-c>bd :Bclose<Enter>
nnoremap <M-a>ba :1,1000 bd!<Enter>
nnoremap <leader>ss :setlocal spell!<Enter>
nnoremap <c-space> ?
nnoremap <down> ddp
nnoremap <up> ddkP
nnoremap <left> <Nop>
nnoremap <right> <Nop>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <S-e> <C-w>=
nnoremap <S-j> :resize +5<Enter>
nnoremap <S-k> :resize -5<Enter>
nnoremap <S-l> :vertical resize +5<Enter>
nnoremap <S-h> :vertical resize -5<Enter>
nnoremap <leader>w :update<Enter>
nnoremap <leader>Hex :%!xxd<Enter>
nnoremap <leader>hex :%!xxd -r<Enter>
nnoremap <leader>cl :set cursorline! cursorline?<Enter>
nnoremap <C-m>m :make<Enter>
nnoremap <C-m>c :make clean<Enter>
nnoremap <C-n> :NERDTreeToggle<Enter>
nnoremap <Leader><Enter> :nohl<Enter>
nnoremap <F8> :TagbarToggle<Enter>
nnoremap <F12> :vnew $MYVIMRC<Enter>
nnoremap <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <silent> * :call VisualSelection('f')<Enter>
vnoremap <silent> # :call VisualSelection('b')<Enter>
vnoremap <silent> <leader>r :call VisualSelection('replace')<Enter>

" These bindinds need perfection. Mabye use a leader key option
" because there are moments in which you do not want to autocomplete
" the braces (e.g parameter less function)
inoremap ( (x)<ESC>Fxvc
inoremap [ [x]<ESC>Fxvc
inoremap { {x}<ESC>Fxvc

tnoremap <Esc> <C-\><C-n>
"}}}

" Useful functions that I found online. I do not have the sources. {{{
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" }}}
