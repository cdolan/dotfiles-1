highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "grimm"

let s:gui = {}
let s:cterm = {}

let s:gui.background = { 'default': '#152B35' }
let s:gui.foreground = { 'default': '#AAA8AC' }
let s:gui.none       = { 'default': 'NONE' }
let s:gui.selection  = { 'default': '#2B4759' }
let s:gui.line       = { 'default': '#1A3644' }
let s:gui.comment    = { 'default': '#2B4759' }

let s:gui.black      = { 'default': '#2B4759' }
let s:gui.red        = { 'default': '#9D534F' }
" let s:gui.red        = { 'default': '#A84A48' }
let s:gui.yellow     = { 'default': '#B09075' }
let s:gui.green      = { 'default': '#878D7D' }
let s:gui.cyan       = { 'default': '#97ABB9' }
let s:gui.blue       = { 'default': '#596E79' }
let s:gui.magenta    = { 'default': '#A37984' }

function! s:hi(group, guifg, guibg, attr)
	if s:gui(a:guifg) != ""
		exec "hi " . a:group . " guifg=" . s:gui(a:guifg)
	endif
	if s:gui(a:guibg) != ""
		exec "hi " . a:group . " guibg=" . s:gui(a:guibg)
	endif

	if a:attr != ""
		exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
	endif
endfunction

function! s:gui(color)
	return a:color['default']
endfunction

" Neovim Terminal colors
if has("nvim")
	let g:terminal_color_0  = s:gui(s:gui.background)
	let g:terminal_color_1  = s:gui(s:gui.red)
	let g:terminal_color_2  = s:gui(s:gui.green)
	let g:terminal_color_3  = s:gui(s:gui.yellow)
	let g:terminal_color_4  = s:gui(s:gui.blue)
	let g:terminal_color_5  = s:gui(s:gui.magenta)
	let g:terminal_color_6  = s:gui(s:gui.cyan)
	let g:terminal_color_7  = s:gui(s:gui.foreground)
	let g:terminal_color_8  = s:gui(s:gui.selection)
	let g:terminal_color_9  = s:gui(s:gui.red)
	let g:terminal_color_10 = s:gui(s:gui.green)
	let g:terminal_color_11 = s:gui(s:gui.yellow)
	let g:terminal_color_12 = s:gui(s:gui.blue)
	let g:terminal_color_13 = s:gui(s:gui.magenta)
	let g:terminal_color_14 = s:gui(s:gui.cyan)
	let g:terminal_color_15 = s:gui(s:gui.foreground)
endif

" EDITOR COLORS
call s:hi("User1",        s:gui.foreground, s:gui.line,       "bold")
call s:hi("User2",        s:gui.green,      s:gui.line,       "bold")
call s:hi("User3",        s:gui.red,        s:gui.line,       "bold")
call s:hi("User4",        s:gui.cyan,       s:gui.line,       "bold")
call s:hi("User5",        s:gui.blue,       s:gui.line,       "bold")
call s:hi("User6",        s:gui.yellow,     s:gui.line,       "bold")
call s:hi("User7",        s:gui.magenta,    s:gui.line,       "bold")
call s:hi("User8",        s:gui.line,       s:gui.background, "bold")
call s:hi("User9",        s:gui.background, s:gui.line,       "bold")

call s:hi("StatusLine",       s:gui.line,   s:gui.foreground, "")
call s:hi("StatusLineNC",     s:gui.line,   s:gui.background, "")
call s:hi("StatusLineTerm",   s:gui.line,   s:gui.foreground, "")
call s:hi("StatusLineTemrNC", s:gui.line,   s:gui.background, "")

call s:hi("NERDTreeOpenable",   s:gui.selection,  s:gui.none,     "")
call s:hi("NERDTreeClosable",   s:gui.red,        s:gui.none,     "")
call s:hi("NERDTreeCWD",        s:gui.comment,    s:gui.none,     "")
call s:hi("NERDTreeDir",        s:gui.blue,       s:gui.none,     "")
call s:hi("NERDTreeDirSlash",   s:gui.background, s:gui.none,     "")
call s:hi("NERDTreeFile",       s:gui.foreground, s:gui.none,     "")

call s:hi("EndOfBuffer",  s:gui.background, s:gui.none,       "")
call s:hi("ColorColumn",  s:gui.none,       s:gui.line,       "")
call s:hi("Cursor",       s:gui.foreground, "",               "")
call s:hi("CursorColumn", s:gui.none,       s:gui.line,       "")
call s:hi("SignColumn",   s:gui.red,        s:gui.none,       "")
call s:hi("LineNr",       s:gui.selection,  "",               "")
call s:hi("CursorLine",   s:gui.none,       s:gui.none,       "")
call s:hi("CursorLineNr", s:gui.foreground, s:gui.none,       "")
call s:hi("Directory",    s:gui.blue,       "",               "")
call s:hi("FoldColumn",   "",               s:gui.none,       "")
call s:hi("Folded",       s:gui.comment,    s:gui.line,       "")
call s:hi("PMenu",        s:gui.green,      s:gui.selection,  "")
call s:hi("PMenuSel",     s:gui.background, s:gui.green,      "")
call s:hi("ErrorMsg",     s:gui.red,        s:gui.none,       "")
call s:hi("Error",        s:gui.red,        s:gui.none,       "")
call s:hi("WarningMsg",   s:gui.red,        "",               "")
call s:hi("SpellBad",     s:gui.red,        s:gui.none,       "none")
call s:hi("VertSplit",    s:gui.line,       s:gui.line,       "")
call s:hi("Conceal",      s:gui.comment,    s:gui.none,       "")

call s:hi("DiffAdded",    s:gui.green,      "", "")
call s:hi("DiffRemoved",  s:gui.red,        "", "")

call s:hi("DiffAdd",      "",               s:gui.cyan,       "")
call s:hi("DiffChange",   "",               s:gui.cyan,       "")
call s:hi("DiffDelete",   s:gui.red,        s:gui.black,      "")
call s:hi("DiffText",     s:gui.background, s:gui.selection,  "")

call s:hi("NonText",      s:gui.line,       "",               "")
call s:hi("helpExample",  s:gui.blue,       "",               "")
call s:hi("MatchParen",   s:gui.background, s:gui.green,      "")
call s:hi("Title",        s:gui.cyan,       "",               "")
call s:hi("Comment",      s:gui.comment,    "",               "italic")
call s:hi("String",       s:gui.green,      "",               "")
call s:hi("Normal",       s:gui.foreground, s:gui.none,       "")
call s:hi("Visual",       s:gui.background, s:gui.blue,       "")
call s:hi("Constant",     s:gui.blue,       "",               "")
call s:hi("Type",         s:gui.blue,       "",               "")
call s:hi("Define",       s:gui.cyan,       "",               "")
call s:hi("Statement",    s:gui.blue,       "",               "")
call s:hi("Function",     s:gui.magenta,    "",               "")
call s:hi("Conditional",  s:gui.red,        "",               "")
call s:hi("Float",        s:gui.green,      "",               "")
call s:hi("Noise",        s:gui.cyan,       "",               "")
call s:hi("Number",       s:gui.red,        "",               "")
call s:hi("Identifier",   s:gui.red,        "",               "")
call s:hi("Operator",     s:gui.cyan,       "",               "")
call s:hi("PreProc",      s:gui.blue,       "",               "")
call s:hi("Search",       s:gui.background, s:gui.yellow,     "")
call s:hi("InSearch",     s:gui.background, s:gui.yellow,     "")
call s:hi("Todo",         s:gui.comment,    "",               "")
call s:hi("Special",      s:gui.magenta,    "",               "") " @observable etc...

" ALE COLORS
call s:hi("ALEInfoSign",         s:gui.red,       s:gui.line, "")
call s:hi("ALEErrorSign",        s:gui.red,       s:gui.line, "")
call s:hi("ALEWarningSign",      s:gui.red,       s:gui.line, "")
call s:hi("ALEStyleErrorSign",   s:gui.red,       s:gui.line, "")
call s:hi("ALEStyleWarningSign", s:gui.red,       s:gui.line, "")

call s:hi("ALEInfoLine",         s:gui.comment,   s:gui.none, "")
call s:hi("ALEErrorLine",        s:gui.comment,   s:gui.none, "")
call s:hi("ALEWarningLine",      s:gui.comment,   s:gui.none, "")

" TYPESCRIPT COLORS
" leafgarland/typescript-vim
call s:hi("typescriptComment",                   s:gui.comment,      "", "italic")
call s:hi("typescriptCommentSkip",               s:gui.comment,      "", "italic")
call s:hi("typescriptCommentTodo",               s:gui.comment,      "", "italic")
call s:hi("typescriptLineComment",               s:gui.comment,      "", "italic")
call s:hi("typescriptRefComment",                s:gui.comment,      "", "italic")
call s:hi("typescriptRefD",                      s:gui.comment,      "", "")
call s:hi("typescriptRefS",                      s:gui.comment,      "", "")

call s:hi("typescriptDocComment",                s:gui.comment,      "", "italic")
call s:hi("typescriptDocTags",                   s:gui.comment,      "", "")
call s:hi("typescriptDocParam",                  s:gui.comment,      "", "")
call s:hi("typescriptDocSeeTag",                 s:gui.comment,      "", "")

call s:hi("typescriptSpecial",                   s:gui.cyan,         "", "")
call s:hi("typescriptStringD",                   s:gui.cyan,         "", "")
call s:hi("typescriptStringS",                   s:gui.cyan,         "", "")
call s:hi("typescriptStringB",                   s:gui.cyan,         "", "")
call s:hi("typescriptInterpolation",             s:gui.green,        "", "")
call s:hi("typescriptNumber",                    s:gui.red,          "", "")
call s:hi("typescriptRegexpString",              s:gui.cyan,         "", "")
call s:hi("typescriptPrototype",                 s:gui.red,          "", "")
call s:hi("typescriptBrowserObjects",            s:gui.red,          "", "")
call s:hi("typescriptDOMObjects",                s:gui.blue,         "", "")
call s:hi("typescriptDOMMethods",                s:gui.yellow,       "", "")
call s:hi("typescriptDOMProperties",             s:gui.yellow,       "", "")
call s:hi("typescriptHtmlElemProperties",        s:gui.cyan,         "", "")
call s:hi("typescriptEventListenerKeywords",     s:gui.cyan,         "", "")
call s:hi("typescriptEventListenerMethods",      s:gui.cyan,         "", "")

call s:hi("typescriptSource",                    s:gui.red,          "", "") " import export from as
call s:hi("typescriptIdentifier",                s:gui.red,          "", "") " arguments this void
call s:hi("typescriptStorageClass",              s:gui.magenta,      "", "") " let var const
call s:hi("typescriptOperator",                  s:gui.blue,         "", "") " delete new instanceof typeof
call s:hi("typescriptBoolean",                   s:gui.red,          "", "") " true false
call s:hi("typescriptNull",                      s:gui.red,          "", "") " null undefined
call s:hi("typescriptMessage",                   s:gui.green,        "", "") " alert confirm prompt status

call s:hi("typescriptConditional",               s:gui.cyan,         "", "") " if else switch
call s:hi("typescriptRepeat",                    s:gui.green,        "", "") " do while for in of
call s:hi("typescriptBranch",                    s:gui.green,        "", "") " break continue yield await
call s:hi("typescriptLabel",                     s:gui.green,        "", "") " case default async readonly
call s:hi("typescriptDecorators",                s:gui.magenta,      "", "") " @action @computed, etc
call s:hi("typescriptStatement",                 s:gui.cyan,         "", "") " return with

call s:hi("typescriptGlobalObjects",             s:gui.blue,         "", "") " Array Boolean Date Function Infinity Math Number NaN Object Packages RegExp String Symbol
call s:hi("typescriptExceptions   ",             s:gui.green,        "", "") " try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError
call s:hi("typescriptReserved",                  s:gui.blue,         "", "") " constructor as interface module enum int export interface static extends super class private implements import public type from get set keyof...
call s:hi("typescriptVars",                      s:gui.green,        "", "")
call s:hi("typescriptParameters",                s:gui.green,        "", "")
call s:hi("typescriptType",                      s:gui.yellow,       "", "") " void any string boolean number symbol never object

call s:hi("typescriptDomErrNo",                  s:gui.red,          "", "")
call s:hi("typescriptDomNodeConsts",             s:gui.red,          "", "")

call s:hi("typescriptHtmlEvents",                s:gui.foreground,   "", "") " onblur onclick onfocus onkeydown onkeypress onkeyup ...

call s:hi("typescriptCssStyles",                 s:gui.red,          "", "") " not sure where these ever occur... ?

call s:hi("typescriptFuncKeyword",               s:gui.blue,         "", "")
call s:hi("typescriptFunction",                  s:gui.magenta,      "", "")

call s:hi("typescriptBraces",                    s:gui.green,        "", "")
call s:hi("typescriptParens",                    s:gui.red,          "", "")
call s:hi("typescriptOpSymbols",                 s:gui.magenta,      "", "")
call s:hi("typescriptEndColons",                 s:gui.cyan,         "", "")
call s:hi("typescriptLogicSymbols",              s:gui.magenta,      "", "")
call s:hi("typescriptDotNotation",               s:gui.yellow,       "", "")

" Javascript colors
" yajs
" call s:hi("javascriptArrayMethod",      s:gui.blue,       "", "")
" call s:hi("javascriptBlock",            s:gui.cyan,       "", "")
" call s:hi("javascriptBraces",           s:gui.cyan,       "", "")
" call s:hi("javascriptBrackets",         s:gui.cyan,       "", "")
" call s:hi("javascriptClassName",        s:gui.magenta,    "", "")
" call s:hi("javascriptClassSuperName",   s:gui.yellow,     "", "")
" call s:hi("javascriptExport",           s:gui.red,        "", "")
" call s:hi("javascriptFuncKeyword",      s:gui.magenta,    "", "")
" call s:hi("javascriptIdentifierName",   s:gui.foreground, "", "")
" call s:hi("javascriptLabel",            s:gui.foreground, "", "")
" call s:hi("javascriptMethod",           s:gui.blue,       "", "")
" call s:hi("javascriptObjectLabel",      s:gui.foreground, "", "")
" call s:hi("javascriptObjectLabelColon", s:gui.cyan,       "", "")
" call s:hi("javascriptObjectMethodName", s:gui.blue,       "", "")
" call s:hi("javascriptOperator",         s:gui.magenta,    "", "")
" call s:hi("javascriptProperty",         s:gui.cyan,       "", "")
" call s:hi("javascriptStringMethod",     s:gui.blue,       "", "")
" call s:hi("javascriptVariable",         s:gui.magenta,    "", "")

" vim-javascript
call s:hi("jsArrowFuncArgs",   s:gui.green,       "", "")
call s:hi("jsArrowFunction",   s:gui.magenta,     "", "")
call s:hi("jsBooleanFalse",    s:gui.red,         "", "")
call s:hi("jsBooleanTrue",     s:gui.red,         "", "")
call s:hi("jsClassBraces",     s:gui.cyan,        "", "")
call s:hi("jsClassDefinition", s:gui.yellow,      "", "")
call s:hi("jsClassKeyword",    s:gui.red,         "", "")
call s:hi("jsConditional",     s:gui.cyan,        "", "")
call s:hi("jsFuncArgs",        s:gui.green,       "", "")
call s:hi("jsFuncBraces",      s:gui.magenta,     "", "")
call s:hi("jsFuncCall",        s:gui.cyan,        "", "")
call s:hi("jsFuncParens",      s:gui.red,         "", "")
call s:hi("jsFunction",        s:gui.blue,        "", "")
call s:hi("jsFunctionKey",     s:gui.magenta,     "", "")
call s:hi("jsGlobalObjects",   s:gui.yellow,      "", "")
call s:hi("jsNoise",           s:gui.magenta,     "", "")
call s:hi("jsObjectKey",       s:gui.foreground,  "", "")
call s:hi("jsOperator",        s:gui.magenta,     "", "")
call s:hi("jsParens",          s:gui.red,         "", "")
call s:hi("jsReturn",          s:gui.green,       "", "")
call s:hi("jsStorageClass",    s:gui.magenta,     "", "")
call s:hi("jsThis",            s:gui.blue,        "", "")

" yats
" call s:hi("typescriptAccessibilityModifier", s:gui.magenta,  "", "")
" call s:hi("typescriptCall",                  s:gui.magenta,  "", "")
" call s:hi("typescriptClassName",             s:gui.yellow,  "", "")
" call s:hi("typescriptExport",                s:gui.red,     "", "")
" call s:hi("typescriptImport",                s:gui.blue,    "", "")
" call s:hi("typescriptInterfaceName",         s:gui.yellow,  "", "")
" call s:hi("typescriptPredefinedType",        s:gui.cyan,    "", "")
" call s:hi("typescriptVariable",              s:gui.magenta,  "", "")
" call s:hi("typescriptOperator",              s:gui.magenta,  "", "")

" HTML colors
call s:hi("htmlTag",            s:gui.cyan,    "", "")
call s:hi("htmlEndTag",         s:gui.cyan,    "", "")
call s:hi("htmlTagName",        s:gui.magenta, "", "")
call s:hi("htmlSpecialTagName", s:gui.red,     "", "")
call s:hi("htmlArg",            s:gui.yellow,  "", "")

" jsx colors

call s:hi("tsxTag",             s:gui.red,       "", "")
call s:hi("tsxTagName",         s:gui.yellow,    "", "")
call s:hi("tsxCloseString",     s:gui.yellow,    "", "")
call s:hi("tsxString",          s:gui.cyan,      "", "")
call s:hi("tsxCloseTag",        s:gui.red,       "", "")
call s:hi("tsxAttrib",          s:gui.blue,      "", "")
call s:hi("tsxEqual",           s:gui.magenta,   "", "")
call s:hi("tsxIfOperator",      s:gui.magenta,   "", "")
call s:hi("tsxAttributeBraces", s:gui.magenta,   "", "")
call s:hi("tsxElseOperator",    s:gui.magenta,   "", "")

call s:hi("xmlTag",     s:gui.cyan,    "", "")
call s:hi("xmlEndTag",  s:gui.cyan,    "", "")
call s:hi("xmlTagName", s:gui.magenta, "", "")
call s:hi("xmlAttrib",  s:gui.yellow,  "", "")
