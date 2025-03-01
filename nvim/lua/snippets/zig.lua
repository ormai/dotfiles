LS.add_snippets("zig", {
  S({ trig = "gpa" },
    {
      T {
        "var gpa = std.heap.GeneralPurposeAllocator(.{}){};",
        "const allocator = gpa.allocator();",
        "defer std.debug.assert(gpa.deinit() == .ok);"
      }
    }),
  S({ trig = "ArrayList" },
    {
      T "var ", I(1), T " = std.ArrayList(", I(2), T { ").init(allocator);", "defer " },
      Rep(1), T ".deinit();"
    }),
})
