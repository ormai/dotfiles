LS.add_snippets("cpp", {
  S({ trig = "print_vector" },
    {
      T {
        "template <class T> void print_vector(const std::vector<T> &v) {",
        "  const int len = v.size();",
        "  std::cout << '[';",
        "  for (int i = 0; i < len; ++i) {",
        "    std::cout << v[i];",
        "    if (i != len - 1) {",
        '      std::cout << ", ";',
        "    }",
        "  }",
        "  std::cout << ']' << std::endl;",
        "}"
      }
    }),
})
