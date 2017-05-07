" Midnight - blue colorscheme based on hilal
" Copyright (c) 2016 Benjamin Bockhöfer <benjamin.bockhoefer@web.de>

set background=dark

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name="midnight"

" Editor settings
hi Normal          guifg=#ffffff    guibg=#111111    gui=NONE
hi Cursor          guifg=#171717    guibg=#dadada    gui=NONE
hi CursorLine      guifg=#87ff00    guibg=#111111    gui=NONE
hi CursorLineNR    guifg=#87ff00    guibg=#111111    gui=BOLD
hi LineNr          guifg=#6f6f6f    guibg=#111111    gui=NONE

" Number column
hi CursorColumn    guifg=NONE       guibg=#1e1e1e    gui=NONE
hi FoldColumn      guifg=#6f6f6f    guibg=#1e1e1e    gui=NONE
hi SignColumn      guifg=#6f6f6f    guibg=#1e1e1e    gui=NONE
hi Folded          guifg=#aeaeae    guibg=#1e1e1e    gui=NONE

" Window/Tab delimiters
hi ColorColumn     guifg=#111111    guibg=#111111    gui=NONE
hi VertSplit       guifg=#111111    guibg=#111111    gui=NONE
hi TabLine         guifg=NONE       guibg=NONE       gui=NONE
hi TabLineFill     guifg=NONE       guibg=NONE       gui=NONE
hi TabLineSel      guifg=NONE       guibg=NONE       gui=NONE

" Navigation/Search
hi Directory       guifg=#5fafaf    guibg=NONE       gui=NONE
hi Search          guifg=#1c1c1c    guibg=#87ff00    gui=NONE
hi IncSearch       guifg=#1c1c1c    guibg=#87ff00    gui=NONE

" Prompt/Status
hi StatusLine      guifg=NONE       guibg=#002c2c    gui=NONE
hi StatusLineNC    guifg=NONE       guibg=#1e1e1e    gui=NONE
hi WildMenu        guifg=#002c2c    guibg=#dadada    gui=NONE
hi Question        guifg=#87afaf    guibg=NONE       gui=NONE
hi Title           guifg=#fafafa    guibg=NONE       gui=BOLD
hi ModeMsg         guifg=#002c2c    guibg=#dadada    gui=BOLD
hi MoreMsg         guifg=#5fafaf    guibg=NONE       gui=NONE

" Visual aid
hi MatchParen      guifg=#83f52c    guibg=NONE       gui=BOLD,UNDERLINE
hi Visual          guifg=#ffffff    guibg=#1e90ff    gui=NONE
hi VisualNOS       guifg=NONE       guibg=#1e90ff    gui=NONE
hi NonText         guifg=#111111    guibg=#111111    gui=NONE
hi Todo            guifg=NONE       guibg=NONE       gui=BOLD,UNDERLINE
hi underlined      guifg=NONE       guibg=NONE       gui=UNDERLINE
hi Error           guifg=#ee7f7f    guibg=NONE       gui=NONE
hi ErrorMsg        guifg=#ee7f7f    guibg=NONE       gui=NONE
hi WarningMsg      guifg=#ffbb66    guibg=NONE       gui=NONE
hi Ignore          guifg=NONE       guibg=NONE       gui=NONE
hi SpecialKey      guifg=#ffdddd    guibg=NONE       gui=NONE

" Variable types
hi Constant        guifg=#ffffff    guibg=NONE       gui=NONE
hi String          guifg=#999999    guibg=NONE       gui=NONE
hi Identifier      guifg=#1e90ff    guibg=NONE       gui=NONE
hi Function        guifg=#7acab0    guibg=NONE       gui=NONE

hi link StringDelimiter String
hi link Character       String
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number

" Language constructs
hi Statement       guifg=#1e90ff    guibg=NONE       gui=NONE
hi Conditional     guifg=#1e90ff    guibg=NONE       gui=NONE
hi Operator        guifg=#ffffff    guibg=NONE       gui=NONE
hi Keyword         guifg=#1e90ff    guibg=NONE       gui=NONE
hi Comment         guifg=#4a4a4a    guibg=NONE       gui=ITALIC
hi Special         guifg=#999999    guibg=NONE       gui=NONE
hi Delimiter       guifg=#1e90ff    guibg=NONE       gui=NONE

hi link Repeat         Conditional
hi link Label          Conditional
hi link Exception      Statement
hi link SpecialComment Special
hi link Debug          Special
hi link SpecialChar    Special
hi link Tag            Special

" C like syntax constructs
hi PreProc         guifg=#609faf    guibg=NONE       gui=NONE
hi Type            guifg=#1e90ff    guibg=NONE       gui=NONE

hi link StorageClass Type
hi link Structure    Type
hi link Typedef      Type
hi link Include      PreProc
hi link Define       PreProc
hi link Macro        PreProc
hi link PreCondit    PreProc

" Diff
hi DiffAdd         guifg=#ffffff    guibg=#308a3f    gui=NONE
hi DiffChange      guifg=#ffffff    guibg=#1f4f8a    gui=NONE
hi DiffDelete      guifg=#ffffff    guibg=#9f4040    gui=NONE
hi DiffText        guifg=#ffffff    guibg=#3f6fba    gui=NONE

" Completion menu
hi Pmenu           guifg=#1e90ff    guibg=#1c1c1c    gui=NONE
hi PmenuSel        guifg=#1e90ff    guibg=#1c1c1c    gui=BOLD
hi PmenuSbar       guifg=NONE       guibg=NONE       gui=NONE
hi PmenuThumb      guifg=NONE       guibg=NONE       gui=NONE

" Spelling
hi SpellBad        guifg=#ee7f7f    guibg=NONE       gui=NONE
hi SpellCap        guifg=NONE       guibg=NONE       gui=NONE
hi SpellLocal      guifg=NONE       guibg=NONE       gui=NONE
hi SpellRare       guifg=NONE       guibg=NONE       gui=NONE

" Syntax highlighting for Java
hi JavaDocTags    guifg=#5e5e5e    guibg=NONE       gui=ITALIC
hi JavaDocComment guifg=#4a4a4a    guibg=NONE       gui=ITALIC
hi JavaAnnotation guifg=#6f8080    guibg=NONE       gui=ITALIC

hi link JavaScopeDecl      Identifier
hi link JavaCommentTitle   JavaDocTags
hi link JavaDocParam       JavaDocTags
hi link JavaDocSeeTagParam JavaDocTags
hi link JavaDocSeeTag      JavaDocTags

" Syntax highlighting for XML
hi XmlTag         guifg=#4ca9b9    guibg=NONE       gui=NONE

hi link XmlTagName XmlTag
hi link XmlEndTag  XmlTag

" Syntax highlighting for HTML
hi link HtmlTag     XmlTagName
hi link HtmlTagName XmlTagName
hi link HtmlEndTag  XmlTagName

" Syntax highlighting for Javascript
hi link JavaScriptNumber Number
