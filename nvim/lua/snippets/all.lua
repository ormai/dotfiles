LS.add_snippets("all", {
  S( "pdfPage",
    {
      T("[/Page "), I(1), T(" /Title ("), I(2), T(") /OUT pdfmark"),
    }
  ),
})
