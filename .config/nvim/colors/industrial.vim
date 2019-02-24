
" -----------------------------------------------------------------------------
" File: industrial.vim
" Description: Ported from hzchris's vim-material theme, which is ported from equinusocio's Material Theme
" Porting From: https://github.com/hzchirs/vim-material
" Originally Ported From: https://github.com/equinusocio/vsc-material-theme
" -----------------------------------------------------------------------------

highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "vim-industrial"

let s:gui = {}
let s:cterm = {}

let s:gui.background = { 'dark': 'NONE', 'light': 'NONE'       }
let s:gui.foreground = { 'dark': '#CFD8DC', 'light': '#CFD8DC' }
let s:gui.none       = { 'dark': 'NONE',    'light': 'NONE',   }
let s:gui.selection  = { 'dark': '#B0BEC5', 'light': '#B0BEC5' }
let s:gui.line       = { 'dark': '#FF6E2C', 'light': '#FF6E2C' }
let s:gui.comment    = { 'dark': '#546E7A', 'light': '#546E7A' }

let s:gui.black        = { 'dark': '#263238', 'light': '#263238' }
let s:gui.red          = { 'dark': '#455A64', 'light': '#455A64' }
let s:gui.yellow       = { 'dark': '#72909D', 'light': '#72909D' }
let s:gui.green        = { 'dark': '#546E7A', 'light': '#546E7A' }
let s:gui.cyan         = { 'dark': '#607D8B', 'light': '#607D8B' }
let s:gui.blue         = { 'dark': '#546E7A', 'light': '#546E7A' }
let s:gui.magenta      = { 'dark': '#FF6E2C', 'light': '#FF6E2C' }

if !exists('g:industrial_style')
  let g:industrial_style='default'
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  if s:gui(a:guifg) != ""
    exec "hi " . a:group . " guifg=" . s:gui(a:guifg)
  endif
  if s:gui(a:guibg) != ""
    exec "hi " . a:group . " guibg=" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfunction

function! s:gui(color)
  if &background == "light"
    return a:color['light']
  else
    if g:industrial_style == 'default'
      return a:color['dark']
    else
      return a:color[g:industrial_style]
    endif
  endif
endfunction

" Neovim Terminal colors
if has("nvim")
  let g:terminal_color_0  = s:gui(s:gui.background)
  let g:terminal_color_1  = s:gui(s:gui.red)
  let g:terminal_color_2  = s:gui(s:gui.green)
  let g:terminal_color_3  = s:gui(s:gui.yellow)
  let g:terminal_color_4  = s:gui(s:gui.blue)
  let g:terminal_color_6  = s:gui(s:gui.cyan)
  let g:terminal_color_7  = s:gui(s:gui.magenta)
  let g:terminal_color_8  = s:gui(s:gui.selection)
  let g:terminal_color_9  = s:gui(s:gui.red)
  let g:terminal_color_10 = s:gui(s:gui.green)
  let g:terminal_color_11 = s:gui(s:gui.yellow)
  let g:terminal_color_12 = s:gui(s:gui.cyan)
  let g:terminal_color_13 = s:gui(s:gui.magenta)
  let g:terminal_color_14 = s:gui(s:gui.cyan)
  let g:terminal_color_15 = s:gui(s:gui.foreground)
endif

" Editor colors
call s:hi("ColorColumn",  s:gui.none,       s:gui.line,       "", "", "")
call s:hi("Cursor",       s:gui.yellow,     "",               "", "", "")
call s:hi("CursorColumn", s:gui.none,       s:gui.line,       "", "", "")
call s:hi("LineNr",       s:gui.comment,    "",               "", "", "")
call s:hi("CursorLine",   s:gui.none,       s:gui.line,       "", "", "")
call s:hi("CursorLineNr", s:gui.none,       s:gui.line,       "", "", "")
call s:hi("Directory",    s:gui.blue,       "",               "", "", "")
call s:hi("FoldColumn",   "",               s:gui.none,       "", "", "")
call s:hi("Folded",       s:gui.comment,    s:gui.line,       "", "", "")
call s:hi("PMenu",        s:gui.foreground, s:gui.line,       "", "", "")
call s:hi("PMenuSel",     s:gui.cyan,       s:gui.selection,  "", "", "bold")
call s:hi("ErrorMsg",     s:gui.red,        s:gui.none,       "", "", "")
call s:hi("Error",        s:gui.red,        s:gui.none,       "", "", "")
call s:hi("WarningMsg",   s:gui.magenta,    "",               "", "", "")
call s:hi("VertSplit",    s:gui.black,      s:gui.foreground, "", "", "")
call s:hi("Conceal",      s:gui.comment,    s:gui.none,       "", "", "")

call s:hi("DiffAdded",   s:gui.green, "", "", "", "")
call s:hi("DiffRemoved", s:gui.red,   "", "", "", "")

call s:hi("DiffAdd",    "",        s:gui.cyan,       "", "", "")
call s:hi("DiffChange", "",        s:gui.cyan,       "", "", "")
call s:hi("DiffDelete", s:gui.red, s:gui.black,      "", "", "")
call s:hi("DiffText",   "",        s:gui.selection,  "", "", "")


call s:hi("NonText",     s:gui.comment,    "",               "", "", "")
call s:hi("helpExample", s:gui.blue,       "",               "", "", "")
call s:hi("MatchParen",  "",               s:gui.selection,  "", "", "")
call s:hi("Title",       s:gui.cyan,       "",               "", "", "")
call s:hi("Comment",     s:gui.comment,    "",               "", "", "italic")
call s:hi("String",      s:gui.green,      "",               "", "", "")
call s:hi("Normal",      s:gui.foreground, s:gui.none,       "", "", "")
call s:hi("Visual",      "",               s:gui.selection,  "", "", "")
call s:hi("Constant",    s:gui.magenta,    "",               "", "", "")
call s:hi("Type",        s:gui.magenta,     "",              "", "", "")
call s:hi("Define",      s:gui.cyan,       "",               "", "", "")
call s:hi("Statement",   s:gui.blue,       "",               "", "", "italic")
call s:hi("Function",    s:gui.blue,       "",               "", "", "bold")
call s:hi("Conditional", s:gui.red,        "",               "", "", "bold")
call s:hi("Float",       s:gui.magenta,    "",               "", "", "")
call s:hi("Noise",       s:gui.cyan,       "",               "", "", "")
call s:hi("Number",      s:gui.magenta,    "",               "", "", "")
call s:hi("Identifier",  s:gui.magenta,    "",               "", "", "")
call s:hi("Operator",    s:gui.cyan,       "",               "", "", "")
call s:hi("PreProc",     s:gui.blue,       "",               "", "", "")
call s:hi("Search",      s:gui.none,       s:gui.none,       "", "", "underline")
call s:hi("InSearch",    s:gui.black,      s:gui.foreground, "", "", "")
call s:hi("Todo",        s:gui.red,        s:gui.foreground, "", "", "italic")
call s:hi("Special",     s:gui.magenta,    "",               "", "", "")


" Ruby colors
call s:hi("rubyClassName",       s:gui.yellow,  "", "", "", "bold")
call s:hi("rubyConstant",        s:gui.yellow,  "", "", "", "")
call s:hi("rubyKeywordAsMethod", s:gui.blue,    "", "", "", "")
call s:hi("rubyOperator",        s:gui.magenta, "", "", "", "")
call s:hi("rubyPseudoVariable",  s:gui.red,     "", "", "", "italic")
call s:hi("rubySymbol",          s:gui.magenta, "", "", "", "")
call s:hi("rubySymbolDelimiter", s:gui.cyan,    "", "", "", "")

"eRuby colors
call s:hi("eRubyDelimiter", s:gui.cyan, "", "", "", "")

" Elixir colors
call s:hi("elixirKeyword", s:gui.blue, "", "", "", "")

" Javascript colors
" yajs
call s:hi("javascriptArrayMethod",      s:gui.blue,       "", "", "", "")
call s:hi("javascriptBlock",            s:gui.cyan,       "", "", "", "")
call s:hi("javascriptBraces",           s:gui.cyan,       "", "", "", "")
call s:hi("javascriptBrackets",         s:gui.cyan,       "", "", "", "")
call s:hi("javascriptClassName",        s:gui.magenta,    "", "", "", "bold")
call s:hi("javascriptClassSuperName",   s:gui.yellow,     "", "", "", "")
call s:hi("javascriptExport",           s:gui.red,        "", "", "", "italic")
call s:hi("javascriptFuncKeyword",      s:gui.magenta,    "", "", "", "bold")
call s:hi("javascriptIdentifierName",   s:gui.foreground, "", "", "", "")
call s:hi("javascriptLabel",            s:gui.foreground, "", "", "", "")
call s:hi("javascriptMethod",           s:gui.blue,       "", "", "", "")
call s:hi("javascriptObjectLabel",      s:gui.foreground, "", "", "", "")
call s:hi("javascriptObjectLabelColon", s:gui.cyan,       "", "", "", "")
call s:hi("javascriptObjectMethodName", s:gui.blue,       "", "", "", "")
call s:hi("javascriptOperator",         s:gui.magenta,    "", "", "", "")
call s:hi("javascriptProperty",         s:gui.cyan,       "", "", "", "")
call s:hi("javascriptStringMethod",     s:gui.blue,       "", "", "", "")
call s:hi("javascriptVariable",         s:gui.magenta,    "", "", "", "")

" vim-javascript
call s:hi("jsArrowFuncArgs",   s:gui.red,        "", "", "", "")
call s:hi("jsArrowFunction",   s:gui.magenta,    "", "", "", "")
call s:hi("jsBooleanFalse",    s:gui.magenta,    "", "", "", "")
call s:hi("jsBooleanTrue",     s:gui.magenta,    "", "", "", "")
call s:hi("jsClassBraces",     s:gui.cyan,       "", "", "", "")
call s:hi("jsClassDefinition", s:gui.yellow,     "", "", "", "bold")
call s:hi("jsClassKeyword",    s:gui.magenta,    "", "", "", "italic")
call s:hi("jsConditional",     s:gui.cyan,       "", "", "", "bold")
call s:hi("jsFuncArgs",        s:gui.red,        "", "", "", "")
call s:hi("jsFuncBraces",      s:gui.cyan,       "", "", "", "")
call s:hi("jsFuncCall",        s:gui.blue,       "", "", "", "")
call s:hi("jsFuncParens",      s:gui.cyan,       "", "", "", "")
call s:hi("jsFunction",        s:gui.red,        "", "", "", "italic")
call s:hi("jsFunctionKey",     s:gui.magenta,    "", "", "", "bold")
call s:hi("jsGlobalObjects",   s:gui.yellow,     "", "", "", "")
call s:hi("jsNoise",           s:gui.cyan,       "", "", "", "")
call s:hi("jsObjectKey",       s:gui.foreground, "", "", "", "")
call s:hi("jsOperator",        s:gui.magenta,    "", "", "", "")
call s:hi("jsParens",          s:gui.cyan,       "", "", "", "")
call s:hi("jsReturn",          s:gui.cyan,       "", "", "", "italic")
call s:hi("jsStorageClass",    s:gui.magenta,    "", "", "", "")
call s:hi("jsThis",            s:gui.red,        "", "", "", "")

" yats
call s:hi("typescriptAccessibilityModifier", s:gui.magenta, "", "", "", "")
call s:hi("typescriptCall",                  s:gui.magenta, "", "", "", "")
call s:hi("typescriptClassName",             s:gui.yellow,  "", "", "", "bold")
call s:hi("typescriptExport",                s:gui.red,     "", "", "", "italic")
call s:hi("typescriptImport",                s:gui.blue,    "", "", "", "italic")
call s:hi("typescriptInterfaceName",         s:gui.yellow,  "", "", "", "bold")
call s:hi("typescriptPredefinedType",        s:gui.cyan,    "", "", "", "")
call s:hi("typescriptVariable",              s:gui.magenta, "", "", "", "italic")
call s:hi("typescriptOperator",              s:gui.magenta, "", "", "", "")

" HTML colors
call s:hi("htmlTag",            s:gui.cyan,   "", "", "", "")
call s:hi("htmlEndTag",         s:gui.cyan,   "", "", "", "")
call s:hi("htmlTagName",        s:gui.red,    "", "", "", "")
call s:hi("htmlSpecialTagName", s:gui.red,    "", "", "", "")
call s:hi("htmlArg",            s:gui.yellow, "", "", "", "")

" jsx colors
call s:hi("xmlTag",     s:gui.cyan,   "", "", "", "")
call s:hi("xmlEndTag",  s:gui.cyan,   "", "", "", "")
call s:hi("xmlTagName", s:gui.red,    "", "", "", "")
call s:hi("xmlAttrib",  s:gui.yellow, "", "", "", "")