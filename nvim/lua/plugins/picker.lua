return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true, -- ← shows dotfiles by default
            ignored = false, -- optional: also show .gitignore'd files (set true if needed)
          },
        },
      },
    },
  },
}
