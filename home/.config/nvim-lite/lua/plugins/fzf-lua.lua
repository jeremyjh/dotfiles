local function git_root()
  local root = vim.fn.system('git rev-parse --show-toplevel 2>/dev/null'):gsub('\n', '')
  return vim.v.shell_error == 0 and root or vim.fn.getcwd()
end

return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>pf", function() require("fzf-lua").files() end, desc = "Find files" },
    { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },
    { "<leader>bb", function() require("fzf-lua").buffers() end, desc = "Switch buffer" },
    { "<leader>sp", function() require("fzf-lua").live_grep({ cwd = git_root() }) end, desc = "Search project" },
  },
}
