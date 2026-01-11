return {

  "supermaven-inc/supermaven-nvim",
  lazy = false,
  priority = 100,
  config = function()
    require("supermaven-nvim").setup({
      disable_inline_completion = false,
      cmp = { enabled = false },
    })
  end,
}
