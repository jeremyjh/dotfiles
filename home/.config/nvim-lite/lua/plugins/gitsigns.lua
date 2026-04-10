return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    current_line_blame = false,
    current_line_blame_opts = { delay = 300 },
  },
  keys = {
    { "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Git blame line" },
    { "<leader>gB", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle inline blame" },
    { "<leader>gd", function() require("gitsigns").diffthis() end, desc = "Diff this" },
    { "]g", function() require("gitsigns").next_hunk() end, desc = "Next hunk" },
    { "[g", function() require("gitsigns").prev_hunk() end, desc = "Prev hunk" },
  },
}
