LS.add_snippets("asm", {
  -- The trigger should be already indented

  S({ trig = ".type", desc = "Function boilerplate (Aarch-64)", },
    {
      T("            .type       "), I(1), T({ ", %function",                     --             .type       main, %function
      "            .global     " }), Rep(1), T({ "", "" }),                       --             .global     main
      Rep(1), T({ ":",                                                            -- main:
      "            stp         x29, x30, [sp, #-16]!", "", "" }),                 --             stp         x29, x30, [sp, #-16]!
      I(2),                                                                       --             *function body*
      T({ "", "", "            mov         w0, #0",                               --             mov         w0, #0
        "            ldp         x29, x30, [sp], #16" }),                         --             ldp         x29, x30, [sp], #16
      T({ "", "            ret",                                                  --             ret
        "            .size        " }), Rep(1), T(", (. - "), Rep(1), T(")")      --            .size       main, (. - main)
    }
  ),

  S({ trig = ".size" },
    {
      T(".size       "), I(1), T(", (. - "), Rep(1), T(")")       -- .size       main, (. - main)
    }
  ),

  S({ trig = ".macro" },
    {
      T(".macro      "), I(1), T({ "", ".endm" })
    }
  ),

  S({ trig = ".section" },
    {
      T(".section    .rodata")
    }
  ),

  S({ trig = "read", desc = "A macro to read user input." },  -- uses GNU C lib
    {
      T({ ".macro      read dest", "" }),
      T({ "adr         x0, prompt", "" }),
      T({ "bl          printf", "" }),
      T({ "adr         x0, fmt_scan", "" }),
      T({ "adr         x1, \\dest", "" }),
      T({ "bl          scanf", "" }),
      T({ ".endm" })
    }
  ),

  S({ trig = "pstate", desc = "Print PSTATE." },
    {
      T({ "fmt_PSTATE: .string     \"NZCV = %d%d%d%d\\n\"", "", "" }),
      T({ ".macro      print_PSTATE", "" }),
      T({ "adr         x0, fmt_PSTATE", "" }),
      T({ "cset        w1, mi", "" }),
      T({ "cset        w2, eq", "" }),
      T({ "cset        w3, cs", "" }),
      T({ "cset        w4, vs", "" }),
      T({ "bl          printf", "" }),
      T({ ".endm" })
    }
  )
})
