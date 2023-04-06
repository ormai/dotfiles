LS.add_snippets("asm", {
  S({ trig = ".type", desc = "Function boilerplate (Aarch-64)", } ,
    {
      T("            .type       "), I(1), T({", %function",                --             .type       main, %function
        "            .global     "}), Rep(1), T({"", ""}),                  --             .global     main
       Rep(1), T({":",                                                      -- main:
        "            stp         x29, x30, [sp, #-16]!", "", ""}),          --             stp         x29, x30, [sp, #-16]!
      T("            "), I(2),                                              --             *function body*
      T({"", "", "            mov         w0, #0",                          --             mov         w0, #0
        "            ldp         x29, x30, [sp], #16"}),                    --             ldp         x29, x30, [sp], #16
      T({"", "            ret",                                             --             ret
        "            size        "}), Rep(1), T(", (. - "), Rep(1), T(")")  --             size        main, (. - main)
    })
})
