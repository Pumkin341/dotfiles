return {

  -- 1. ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      { "<c-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "t" } },
    },
    opts = {
      size = 20,
      open_mapping = [[<c-/>]],
      direction = "horizontal",
      autochdir = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_mode = true,
      persist_size = true,
      shell = vim.o.shell,
    },
  },

  -- 2. Code Runner (with correct repo!)
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "python", "lua", "cpp", "c", "go", "rust", "typescript", "javascript", "sh", "zsh", "bash" },
    cmd = "RunCode",
    keys = {
      { "<leader>rr", "<cmd>RunCode<cr>", desc = "Run Code" },
      { "<leader>rf", "<cmd>RunFile<cr>", desc = "Run File" },
      { "<leader>rp", "<cmd>RunProject<cr>", desc = "Run Project" },
      { "<leader>rc", "<cmd>RunClose<cr>", desc = "Close Runner" },
    },
    opts = {
      mode = "toggleterm",
      focus = true,
      filetype = {
        python = "python3 -u",
        lua = "lua",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        go = "go run",
        rust = "cargo run",
        typescript = "deno run",
        javascript = "node",
      },
    },
  },
}
