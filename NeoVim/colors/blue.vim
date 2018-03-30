set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'blue'

hi Normal                       guifg=#ffffff guibg=#111111 gui=NONE      
hi NonText                      guifg=#111111 guibg=NONE    gui=NONE      
hi Comment                      guifg=#777777 guibg=NONE    gui=NONE      
hi Constant                     guifg=#40bdff guibg=NONE    gui=NONE      
hi Directory                    guifg=#40bdff guibg=NONE    gui=NONE      
hi Identifier                   guifg=#1e90ff guibg=NONE    gui=NONE      
hi PreProc                      guifg=#787878 guibg=NONE    gui=NONE     
hi Special                      guifg=#1e90ff guibg=NONE    gui=NONE      
hi Statement                    guifg=#ffffff guibg=NONE    gui=NONE      
hi Title                        guifg=#cccccc guibg=NONE    gui=BOLD      
hi Type                         guifg=#64B2DB guibg=NONE    gui=NONE      
hi SpecialKey                   guifg=#40bdff guibg=NONE    gui=NONE      
hi Conditional                  guifg=#1e90ff guibg=NONE    gui=NONE      
hi Operator                     guifg=#1e90ff guibg=NONE    gui=NONE      
hi Exception                    guifg=#1e90ff guibg=NONE    gui=NONE      
hi Label                        guifg=#64B2DB guibg=NONE    gui=NONE      
hi Repeat                       guifg=#1e90ff guibg=NONE    gui=NONE      
hi Keyword                      guifg=#1e90ff guibg=NONE    gui=NONE      
hi String                       guifg=#40bdff guibg=NONE    gui=NONE      
hi Character                    guifg=#40bdff guibg=NONE    gui=NONE      
hi Boolean                      guifg=#40bdff guibg=NONE    gui=NONE      
hi Number                       guifg=#40bdff guibg=NONE    gui=NONE      
hi Function                     guifg=#EFEFEF guibg=NONE    gui=NONE      
hi UNDERLINEd                   guifg=#cccccc guibg=NONE    gui=underline 
hi Cursor                       guifg=#6a6a6a guibg=#EFEFEF gui=NONE      
hi CursorIM                     guifg=#191919 guibg=#cccccc gui=NONE      
hi CursorColumn                 guifg=NONE    guibg=#292929 gui=NONE      
hi CursorLine                   guifg=NONE    guibg=#292929 gui=NONE      
hi Visual                       guifg=#EFEFEF guibg=#515151 gui=NONE      
hi VisualNOS                    guifg=#EFEFEF guibg=#515151 gui=NONE      
hi IncSearch                    guifg=#EFEFEF guibg=#64B2DB gui=NONE      
hi MatchParen                   guifg=#000000 guibg=#05c50b gui=BOLD      
hi Search                       guifg=#000000 guibg=#05c50b gui=BOLD      
hi Error                        guifg=#FF3D23 guibg=NONE    gui=BOLD      
hi Todo                         guifg=#DEDD5A guibg=NONE    gui=BOLD     
hi PreProc                      guifg=#1e90ff guibg=NONE    gui=NONE
hi Question                     guifg=#64B2DB guibg=NONE    gui=NONE      
hi ErrorMsg                     guifg=#FF3D23 guibg=NONE    gui=BOLD      
hi MoreMsg                      guifg=#87bf19 guibg=NONE    gui=NONE      
hi WarningMsg                   guifg=#DEDD5A guibg=NONE    gui=NONE      
hi ColorColumn                  guifg=NONE    guibg=#191919 gui=BOLD      
hi Pmenu                        guifg=#ffffff guibg=#010101 gui=NONE      
hi PmenuSel                     guifg=#1e90ff guibg=#000000 gui=BOLD
hi PmenuSbar                    guifg=#111111 guibg=#111111 gui=NONE
hi PmenuThumb                   guifg=#1e90ff guibg=#1e90ff gui=NONE      
hi StatusLine                   guifg=#cccccc guibg=NONE    gui=NONE      
hi StatusLineNC                 guifg=#cccccc guibg=NONE    gui=NONE      
hi CursorLineNr                 guifg=#cccccc guibg=#292929 gui=BOLD      
hi TabLine                      guifg=#cccccc guibg=NONE    gui=NONE      
hi TabLineFill                  guifg=#cccccc guibg=NONE    gui=NONE      
hi FoldColumn                   guifg=#40bdff guibg=#191919 gui=NONE      
hi Folded                       guifg=#1e90ff guibg=#191919 gui=NONE      
hi LineNr                       guifg=#6a6a6a guibg=#0F0F0F gui=NONE      
hi SignColumn                   guifg=NONE    guibg=#111111 gui=NONE      
hi VertSplit                    guifg=#666666 guibg=#111111 gui=NONE      
hi WildMenu                     guifg=#191919 guibg=#40bdff gui=NONE      
hi OverLength                   guifg=NONE    guibg=#20272F gui=NONE      
hi DiffAdd                      guifg=#87bf19 guibg=NONE    gui=BOLD      
hi DiffChange                   guifg=#DEDD5A guibg=NONE    gui=BOLD      
hi DiffDelete                   guifg=#FF3D23 guibg=NONE    gui=BOLD      
hi DiffText                     guifg=#cccccc guibg=NONE    gui=BOLD      
hi SpellBad                     guisp=#FF3D23 guibg=NONE    gui=UNDERCURL  
hi SpellCap                     guisp=#87bf19 guibg=NONE    gui=UNDERCURL  
hi SpellLocal                   guisp=#DEDD5A guibg=NONE    gui=UNDERCURL  
hi SpellRare                    guisp=#DEDD5A guibg=NONE    gui=UNDERCURL  
hi helpSpecial                  guifg=#cccccc guibg=NONE    gui=NONE      
hi helpHyperTextJump            guifg=#40bdff guibg=NONE    gui=UNDERLINE 
hi helpNote                     guifg=#cccccc guibg=NONE    gui=NONE      

" Plugin specific colors
hi GitGutterAddDefault          guifg=#87bf19 guibg=NONE    gui=NONE      
hi GitGutterChangeDefault       guifg=#DEDD5A guibg=NONE    gui=NONE      
hi GitGutterDeleteDefault       guifg=#FF3D23 guibg=NONE    gui=NONE      

" Language specific colors
" JSON specific adjustments
hi jsonBraces                   guifg=#1e90ff guibg=NONE    gui=NONE
hi jsonString                   guifg=#40bdff guibg=NONE    gui=NONE 
hi jsonKeyword                  guifg=#1e90ff guibg=NONE    gui=NONE

" C/C++ specific adjustments
hi cType                        guifg=#1e90ff
hi cppType                      guifg=#1e90ff
hi cppAccess                    guifg=#1e90ff
hi cppStructure                 guifg=#1e90ff

" Python specific adjustments
hi pythonStatement              guifg=#1e90ff
hi pythonFunction                                          gui=bold

" Java specific adjustments
hi javaParen                    guifg=#1e90ff
hi javaClassDecl                guifg=#1e90ff
hi javaScopeDecl                guifg=#1e90ff

" Bash specific adjustments
hi shRange                      guifg=#ffffff
hi shFunctionTwo                                           gui=bold
hi shFunctionKey                                           gui=bold
hi shFunction                                              gui=bold

" Vim specific adjustments
hi vimGroup                     guifg=#1e90ff
hi vimHiGroup                   guifg=#1e90ff

" HTML specific adjustments
hi link    htmlTagName             Type

" JavaScript specific adjustments
hi link    javaScriptStatement     javaScriptOperator
