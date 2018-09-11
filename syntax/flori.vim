if exists("b:current_syntax")
  finish
endif

syn region floriLineComment start=+#+ end=+$+
hi def link floriLineComment Comment

syn region floriParen start='(' end=')' transparent
syn region floriBlock start="{" end="}" transparent fold

" string
syn region floriString start=+"+ skip=+\\\\\|\\"+ end=+"+
hi def link floriString String

syn match floriDeclIdent /[a-zA-Z_`!\+-\*\/<>%&.][a-zA-Z0-9_`!\+-\*\/<>%&.]*/ contained
hi def link floriDeclIdent Function
syn match floriLocalIdent /[a-zA-Z_`!\+-\*\/<>%&.][a-zA-Z0-9_`!\+-\*\/<>%&.]*/ contained
hi def link floriLocalIdent Special

" keyword
syn keyword floriImport import
hi def link floriImport Keyword

syn match floriType /[A-Z][a-zA-Z0-9]*/
hi def link floriType Type

" builtins
syn keyword floriBuiltins init alloc dealloc realloc alloc_with in_region quote cast ref unref getptr getref
syn keyword floriStatements if elif else for while
syn keyword floriBoolean true false
hi def link floriBuiltins Keyword
hi def link floriStatements Keyword
hi def link floriBoolean Boolean

syn match floriVarDefs /\v\w+(,\s*\w+)*\ze(\s*:\=)/
syn match floriVar /\<var\>/ nextgroup=floriLocalIdent skipwhite skipnl
syn match floriConst /\<const\>/ nextgroup=floriLocalIdent skipwhite skipnl
hi def link floriVarDefs Special
hi def link floriVar Keyword
hi def link floriConst Keyword

syn match floriFn /\<fn\>/ nextgroup=floriDeclIdent skipwhite skipnl
syn match floriMacro /\<macro\>/ nextgroup=floriDeclIdent skipwhite skipnl
syn match floriSyntax /\<syntax\>/ nextgroup=floriDeclIdent skipwhite skipnl
syn match floriType /\<type\>/ nextgroup=floriDeclIdent skipwhite skipnl
hi def link floriFn Keyword
hi def link floriMacro Keyword
hi def link floriSyntax Keyword
hi def link floriType Keyword

let b:current_syntax = "flori"
