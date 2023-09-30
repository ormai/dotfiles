
LS.add_snippets("markdown", {
  S( { trig = "matrix", desc = "Math matrix for LaTex"},
    {
      T("\\left[\\begin{array}{cc} "), I(1), T(" \\\\ "), I(2), T(" \\end{array}\\right]"),
    }
  ),
  S( { trig = "vector", desc = "Math vector for LaTex"},
    {
      T("\\overrightarrow{"), I(1), T("}"),
    }
  ),
  S( { trig = "prodotto scalare", desc = "Math dot product for LaTex"},
    {
      T("\\langle\\ \\overrightarrow{"), I(1), T("}\\ \\vert\\ \\overrightarrow{"), I(2), T("}\\ \\rangle")
    }
  ),
})
