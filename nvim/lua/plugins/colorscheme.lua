return {
  "bluz71/vim-moonfly-colors",
  name = "moonfly", -- important: lets you load with :colorscheme moonfly
  lazy = false, -- load immediately
  priority = 1000, -- load before other plugins
  config = function()
    -- Optional: customize a few things (all defaults are great out-of-the-box)
    vim.g.moonflyCursorColor = true -- colored cursor
    vim.g.moonflyWinSeparator = 2 -- thicker separators
    vim.g.moonflyNormalFloat = true -- better :h popup / float bg
    vim.g.moonflyTransparent = false -- set true for no bg color
    vim.g.moonflyUnderlineMatchParen = true -- underline matching parens

    -- Enable true color (usually already set, but good to ensure)
    vim.o.termguicolors = true

    -- Apply it
    vim.cmd([[colorscheme moonfly]])
  end,
}
