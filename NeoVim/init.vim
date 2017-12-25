" autocmds/augroups {{{
if !exists("autocommands_loaded")
	let autocommands_loaded = 1
        autocmd BufReadPost *           
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

        autocmd BufWrite *.py :call DeleteTrailingWS()
        autocmd BufWrite *.coffee :call DeleteTrailingWS()
endif
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
set signcolumn=yes              " Always show signcolumn
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
colorscheme blue
" }}}

" Variables {{{
let mapleader=","
" }}}

" Mappings {{{
nnoremap j gj
nnoremap k gk
nnoremap Q <Nop>
nnoremap <M-right> :bn<Enter>
nnoremap <M-left> :bp<Enter>
nnoremap <M-n>bn :new<Enter>
nnoremap <M-c>bd :Bclose<Enter>
nnoremap <M-a>ba :1,1000 bd!<Enter>
nnoremap <leader>ss :setlocal spell!<Enter>

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
nnoremap j jzz
nnoremap k kzz
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
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <silent> * :call VisualSelection('f')<Enter>
vnoremap <silent> # :call VisualSelection('b')<Enter>
vnoremap <silent> <leader>r :call VisualSelection('replace')<Enter>

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

" Plugins {{{
call plug#begin('~/.config/nvim/plug')
" Eye candy
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

" Colorschemes
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

" File management
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'scrooloose/nerdtree'

" Text and code helper
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'

" CVS tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax files
Plug 'wavded/vim-stylus'
Plug 'digitaltoad/vim-pug'
Plug 'jelera/vim-javascript-syntax'

" Autocompletion 
Plug 'Valloric/YouCompleteMe'
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()
" }}}

" Plugin settings {{{

" Tagbar settings
let g:tagbar_sort = 1
let g:tagbar_indent = 2
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 0

" vim-lightline settings
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" YouCompleteMe
 let g:ycm_global_ycm_extra_conf = '/home/benjamin/.config/nvim/ycm_extra_conf.py'

" javacomplete2 settings 
let g:JavaComplete_ClosingBrace = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete
" }}} 
