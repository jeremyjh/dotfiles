return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
  },
  opts = {
    window = { width = 30 },
    filesystem = {
      follow_current_file = { enabled = true },
    },
  },
}
