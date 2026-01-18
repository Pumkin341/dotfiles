return {
  "gbprod/cutlass.nvim",
  opts = {
    cut_key = "m",
    override_del = true,
    exclude = { "dgg", "dG" },
    registers = {
      select = "_",
      delete = "_",
      change = "_",
    },
  },
}
