" Vim syntax file
" Language: Answer Set Programming (ASP)
" Maintainer: Mario D'Andrea
" Latest Revision: 08 May 2025

if exists("b:current_syntax")
  finish
endif

" Case sensitivity matters in ASP
syntax case match

" Comments
syn match aspComment "%.*$"
syn region aspBlockComment start="%\*" end="\*%" contains=@Spell

" Variables (must start with uppercase letter)
syn match aspVariable "\<[A-Z][a-zA-Z0-9_]*\>"

" Strings
syn region aspString start=+"+ skip=+\\"+ end=+"+ contains=@Spell

syn match aspPredicate "\<[a-z][a-zA-Z0-9_]*\>"

" Numbers
syn match aspNumber "\<\(0\|[1-9][0-9]*\)\(\.[0-9]\+\)\?\>"

" Annotations
" Annotations - handle @ separately
syn match aspAnnotationMarker "%\?@" nextgroup=aspAnnotationName
syn match aspAnnotationName "[a-z][a-zA-Z0-9_]*" contained

" Aggregates
syn match aspAggregate "#\(count\|sum\|min\|max\)"

" Negation
syn keyword aspNegation not

" External predicates
syn match aspExternalPredicate "&[a-z][a-zA-Z0-9_]*"

" Predicate conversions
syn keyword aspPredicateConversion U_INT UT_INT UR_INT T_INT R_INT CONST Q_CONST

" Directives
syn match aspDirective "#\(show\|external_predicate_conversion\|import_sql\|export_sql\|import_local_sparql\|import_remote_sparql\)\>"

" Define highlights
hi def link aspComment Comment
hi def link aspBlockComment Comment
hi def link aspVariable @variable
hi def link aspString String
hi def link aspPredicate Function
hi def link aspNumber Number
hi def link aspAnnotationMarker PreProc
hi def link aspAnnotationName PreProc
hi def link aspAggregate Special
hi def link aspNegation Keyword
hi def link aspExternalPredicate Special
hi def link aspPredicateConversion Type
hi def link aspDirective PreProc

" Common ASP symbols and operators
" ASP specific operators
syn match aspImplication "\:-" containedin=aspColon
syn match aspConjunction ","
syn match aspDisjunction ";"
syn match aspPeriod "\."
"syn match aspAssign ":="
syn match aspWeak "\:\~" containedin=aspColon
syn match aspConditional "?:"
syn match aspInterval "\.\."
" Arithmetic and comparison operators
syn match aspArithOp "[+\-*/]"
syn match aspCompOp "[=<>]"
syn match aspCompOp "=="
syn match aspCompOp "!="
syn match aspCompOp "<="
syn match aspCompOp ">="
syn match aspColon ":"

" Punctuation/brackets
syn match aspBracket "[\[\](){}]"
hi def link aspImplication Conditional
hi def link aspConjunction Operator
hi def link aspDisjunction Operator
hi def link aspCompOp Operator
hi def link aspColon Operator
hi def link aspPeriod Operator
hi def link aspAssign Operator
hi def link aspConditional Operator
hi def link aspArithOp Operator
hi def link aspWeak Conditional
hi def link aspComp Operator
hi def link aspInterval Operator
hi def link aspOperator Operator
hi def link aspBracket Delimiter

" Common ASP keywords
syn keyword aspKeyword not
hi def link aspKeyword Keyword

let b:current_syntax = "lp"
