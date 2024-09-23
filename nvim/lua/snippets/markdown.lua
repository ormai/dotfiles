LS.add_snippets("markdown", {
  S({ trig = "matrix", desc = "Math matrix for LaTex" },
    {
      T("\\left[\\begin{array}{rr} "), I(1), T(" \\\\ "), I(2), T(" \\end{array}\\right]"),
    }
  ),
  S({ trig = "vector", desc = "Math vector for LaTex" },
    {
      T("\\overrightarrow{"), I(1), T("}"),
    }
  )
})
