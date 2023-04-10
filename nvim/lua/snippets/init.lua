-- These abbreviation are only set once
LS = require("luasnip")
S = LS.snippet
SN = LS.snippet_node
ISN = LS.indent_snippet_node
T = LS.text_node
I = LS.insert_node
F = LS.function_node
C = LS.choice_node
D = LS.dynamic_node
R = LS.restore_node
Events = require("luasnip.util.events")
AI = require("luasnip.nodes.absolute_indexer")
Extras = require("luasnip.extras")
L = Extras.lambda
Rep = Extras.rep
P = Extras.partial
M = Extras.match
N = Extras.nonempty
DL = Extras.dynamic_lambda
Fmt = require("luasnip.extras.fmt").fmt
Fmta = require("luasnip.extras.fmt").fmta
Conds = require("luasnip.extras.expand_conditions")
Postfix = require("luasnip.extras.postfix").postfix
Types = require("luasnip.util.types")
Parse = require("luasnip.util.parser").parse_snippet
MS = LS.multi_snippet

require("snippets.asm")
require("snippets.all")
