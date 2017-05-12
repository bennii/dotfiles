" Settings {{{
set magic 					    " For regular expressions turn magic on
set number                      " Enable line numbers
set relativenumber              " Enable relative line numbers
set nowrap
set autoread 				    " Set to auto read when a file is changed from the outside
set noshowmode
set lazyredraw
set termguicolors               " Enable GUI colors in Terminal. Requires terminal with true colors enabled
set autoindent                  " Enable auto indentation
set smartindent                 " Indent smart
set smarttab
set incsearch  				    " Makes search act like search in modern browsers
set mat=1 					    " How many tenths of a second to blink when matching brackets
set showmatch 				    " Show matching brackets when text indicator is over them
set noshowmode 				    " Hide default mode indicator
set noerrorbells 			    " No annoying sound on errors
set novisualbell                " Disable visual effects on errors
set nowb                        " Do not use backups before writing a file. Saves my SSD lifetime
set nobackup                    " Do not make a backup before overwriting a file
set noswapfile                  " Do not use a swap file. Save some of my SSD life
set smarttab                    " Be smart when using tabs
set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " 1 tab = 4 spaces
set shiftwidth=4                " 1 tab == 4 spaces
set wildmenu 				    " Turn on the wild menu
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set spelllang=de_de             " I am german
set colorcolumn=101             " Enable ColorColumn at Column 101
set ffs=unix,dos,mac            " Use Unix as the standard file type
set whichwrap+=<,>,h,l          " Additional keys to move between lines
set fillchars=vert:\│           " Better looking UTF characters
set foldmethod=marker           " Use {{{,}}} to define folding areas
set completeopt-=preview        " Disable preview window during completion
set clipboard+=unnamedplus      " Disable registers and always use the clipboard to copy/paste
set backspace=eol,start,indent  " Configure backspace so it acts as it should act

syntax enable
filetype plugin on
filetype indent on
colorscheme phoenix
" }}}

" Variables {{{
let mapleader=","
" }}}

" Mappings {{{
map j gj
map k gk
map Q <Nop>
map <leader>bl :bn<cr>
map <leader>bh :bp<cr>
map <leader>bn :new<cr>
map <leader>bd :Bclose<cr>
map <leader>ba :1,1000 bd!<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tl :tabnext<cr>
map <leader>th :tabprevious<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>ss :setlocal spell!<cr>

noremap ds{ F{xf}x
noremap cs{ F{xf}xi
noremap ds" F"x,x
noremap cs" F"x,xi
noremap ds' F'x,x
noremap cs' F'x,xi
noremap ds( F(xf)x
noremap cs( F(xf)xi
noremap ds) F(xf)x
noremap cs) F(xf)xi
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
nnoremap <leader>w :w!<cr>
nnoremap <leader>Hex :%!xxd<Enter>
nnoremap <leader>hex :%!xxd -r<Enter>
nnoremap <F8> :TagbarToggle<Enter>
nnoremap <F12> :vnew $MYVIMRC<Enter>
nnoremap <C-n> :NERDTreeToggle<Enter>
nnoremap <C-w> :set wrap! wrap?<Enter>
nnoremap <C-i> :IndentLinesToggle<Enter>
nnoremap <Leader><Enter> :nohl<Enter>
nnoremap <Leader>cl :set cursorline! cursorline?<Enter>

vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <silent> * :call VisualSelection('f')<Enter>
vnoremap <silent> # :call VisualSelection('b')<Enter>
vnoremap <silent> <leader>r :call VisualSelection('replace')<Enter>
"}}}

" Adjust colorscheme {{{
hi Folded               guifg=#1e90ff   guibg=#191919
hi Search               guifg=#000000                   gui=bold
hi Normal               guifg=#CCCCCC   guibg=#111111   gui=none
hi NonText              guifg=#111111
hi ColorColumn                          guibg=#191919
hi EasyMotionTarget     guifg=#204adf   guibg=#111111   gui=bold
hi ALEErrorSign         guifg=#ff1a1a   guibg=NONE
hi ALEWarningSign       guifg=#fcfc4b   guibg=NONE
" }}}

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

" autocmds {{{
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

" Plugins {{{
call plug#begin('~/.config/nvim/plug')
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs'
call plug#end()
" }}}

" Plugin settings {{{
" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang/4.0.0/include/"
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"

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

" indentLine settings
let g:indentLine_char = '┊'
" }}}
