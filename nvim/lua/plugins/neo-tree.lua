return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- icons (recommended)
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- optional for better image preview
  },
  opts = {
    open_on_setup = true, -- open neo-tree on startup
    auto_open = true, -- automatically open when vim starts
    close_if_last_window = false, -- keep sidebar even if last window
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    -- Sidebar settings
    window = {
      position = "left", -- "left", "right", "float", etc.
      width = 35, -- comfortable width
      mappings = {
        ["l"] = "open", -- expand/open like many IDEs
        ["h"] = "close_node",
        ["<space>"] = "none", -- disable if it conflicts
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
            vim.notify("Copied: " .. path)
          end,
          desc = "Copy Path to Clipboard",
        },
      },
    },

    filesystem = {
      bind_to_cwd = false, -- don't change cwd when navigating
      follow_current_file = { enabled = true }, -- auto-focus current file
      use_libuv_file_watcher = true, -- faster auto-refresh on changes

      filtered_items = {
        hide_dotfiles = false, -- hide .git, .DS_Store, etc.
        hide_gitignored = true,
      },
    },

    -- Optional: better nesting (groups related files)
    nesting_rules = {
      ["js"] = { ".js", ".jsx", ".ts", ".tsx" },
      -- add your own patterns
    },
  },
}
