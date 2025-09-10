LS.add_snippets("rust", {
  S({ trig = "directions" },
    {
      T { "#[rustfmt::skip]",
        "const DIRECTIONS: [(i8, i8); 8] = [",
        "    (-1,  1), (0,  1), (1,  1),",
        "    (-1,  0),          (1,  0),",
        "    (-1, -1), (0, -1), (1, -1),",
        "];" },
    }),
})
