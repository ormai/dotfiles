if exists("b:current_syntax")
  finish
endif

syntax match BnfNonTerminal "\v[<]?[a-z][a-z0-9_-]*[>]?"
syntax region BnfTerminal start="\"" end="\""
syntax region BnfTerminal start="\'" end="\'"
syntax match BnfProduction "::="
syntax match BnfChoice "|"
syntax match BnfComment "//.*$"

highlight link BnfNonTerminal Variable
highlight link BnfTerminal String
highlight link BnfProduction Keyword
highlight link BnfChoice Operator
highlight link BnfComment Comment
