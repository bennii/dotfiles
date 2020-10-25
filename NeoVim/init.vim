call plug#begin('~/.config/nvim/plug')

" Git related plugins
Plug 'airblade/vim-gitgutter'

" Code completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'dart-lang/dart-vim-plugin'

" Code formatting
Plug 'preservim/nerdcommenter'

" Syntax files
Plug 'sheerun/vim-polyglot'

" Eye candy
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Editor settings
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

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
set path=$PWD/**
set shiftwidth=4
set signcolumn=yes
set tabstop=4
set termguicolors
set wildmenu
set inccommand=nosplit
set updatetime=300
set clipboard+=unnamedplus

colors gruvbox
filetype plugin on
filetype indent on

" Mappings
let mapleader=","

nnoremap j jzz
nnoremap k kzz
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F12> :vsp $MYVIMRC<CR>

nnoremap <F5> :make<CR>
nnoremap <silent> <C-k> :call <SID>show_documentation()<CR>

" VSCode mappings stolen because of habbit
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <M-S-f> :Format<CR>
inoremap <silent><expr> <c-space> coc#refresh()

" coc code navigation and other features
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <leader>gl :call GitLog(0)<CR>
nnoremap <silent> <leader>go :call GitLog(1)<CR>

" Use <CR> to confirm the selected complete option
if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Plugin settings

" coc.nvim extensions
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-angular', 'coc-go', 'coc-flutter', 'coc-rls', 'coc-python', 'coc-omnisharp']

" lightline
let g:lightline = { 'colorscheme': 'gruvbox' }

" gitgutter
let g:gitgutter_git_executable = '/bin/git'
let g:gitgutter_sign_added = '❚'
let g:gitgutter_sign_modified = '❚'
let g:gitgutter_sign_removed = '❚'
let g:gitguttef_sign_removed_first_line = '❚'
let g:gitgutter_sign_modified_removed = '❚'

" NERDTree
let g:NERDTreeWinSize=48
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

" Custom commands
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=* Make make <args> | cwindow 3

" Return to last cursor position after revisiting a file
" Source: https://askubuntu.com/questions/202075/how-do-i-get-vim-to-remember-the-line-i-was-on-when-i-reopen-a-file
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Center on cursor position when opening a buffer
augroup InitGroup
    autocmd BufEnter * :normal zz
augroup END

augroup FileTypeSettings
    autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0
augroup END

augroup FileTypeMakeprgSettings
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

" Open the git log in a floating window
function! GitLog(isShort)
    if exists("g:git_window")
        call nvim_win_close(g:git_window, v:true)
        unlet g:git_window
        return
    endif

    let x = nvim_win_get_width(0)/2-2
    let y = nvim_win_get_height(0)/2-2
    let buf = nvim_create_buf(v:false, v:true)

    if a:isShort == 1
        let gitlog = systemlist("git log --oneline")
    else
        let gitlog = systemlist("git log")
    endif

    let columns = 0
    let lines = len(gitlog)
    
    " Find longest element to determine width
    for elem in gitlog
        if len(elem) > columns
            let columns = len(elem)
        endif
    endfor

    " Only allow the window to be a certain height
    if lines > y + 2
        let lines = y + 2
    endif

    " Only allow the window to be a certain width
    if columns > x + 2
        let columns = x + 2
    endif

    let opts = {'relative': 'editor', 'width': columns, 'height': lines, 'col': x-(columns/2), 'row': y-(lines/2), 'style': 'minimal'}
    let g:git_window = nvim_open_win(buf, 0, opts)

    call nvim_buf_set_lines(buf, 0, -1, v:true, gitlog)
endfunction
