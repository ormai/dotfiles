LS.add_snippets("rust", {
  S({ trig = "directions" },
    {
      T { "for (dr, dc) in [(-1, 0), (-1, 1), (1, 1), (0, 1), (1, -1), (1, 0), (-1, -1), (0, -1)] {", "" },
      I(1),
      T { "", "}" }
    }),
})
