-- Spacemacs-style keybindings for AstroNvim v5
-- Leader key is Space (set in lazy_setup.lua)
--
-- Key groups:
--   SPC b   Buffers          SPC p   Projects
--   SPC c   Comments         SPC q   Quit
--   SPC e   Errors           SPC s   Search
--   SPC f   Files            SPC t   Toggles
--   SPC g   Git              SPC w   Windows
--   SPC h   Help             SPC x   Text
--   SPC j   Jump             SPC l   LSP
--   SPC '   Terminal         SPC ;   Comment line
--   SPC /   Search project   SPC SPC Commands (M-x)
--   SPC TAB Last buffer      SPC 0   Focus file tree
--
-- Insert mode: Emacs-style C-a, C-e, C-f, C-b, C-d, C-k
-- Escape: fd in insert mode (Spacemacs default)

---@type LazySpec
return {
  -- ==========================================
  -- Core keybindings via AstroCore
  -- ==========================================
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local maps = opts.mappings
      if not maps then
        maps = {}
        opts.mappings = maps
      end
      for _, mode in ipairs({ "n", "v", "i", "c", "t" }) do
        if not maps[mode] then maps[mode] = {} end
      end

      local n, v, i, c = maps.n, maps.v, maps.i, maps.c

      -- ========================================
      -- Disable conflicting AstroNvim defaults
      -- ========================================
      n["<Leader>C"] = false -- force close buffer
      n["<Leader>o"] = false -- focus explorer
      n["<Leader>W"] = false -- save (no format)
      n["<Leader>H"] = false -- home (if mapped)

      -- ========================================
      -- Top-level Spacemacs bindings
      -- ========================================
      n["<Leader><Leader>"] = { function() Snacks.picker.commands() end, desc = "M-x (commands)" }
      n["<Leader><Tab>"] = { "<Cmd>b#<CR>", desc = "Last buffer" }
      n["<Leader>/"] = { function() Snacks.picker.grep() end, desc = "Search project" }
      n["<Leader>;"] = { "gcc", desc = "Comment line", remap = true }
      n["<Leader>*"] = {
        function() Snacks.picker.grep({ search = vim.fn.expand("<cword>") }) end,
        desc = "Search word at point",
      }
      n["<Leader>'"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Terminal" }
      n["<Leader>0"] = { "<Cmd>Neotree focus<CR>", desc = "Focus file tree" }
      n["<Leader>P"] = { "<Cmd>Lazy<CR>", desc = "Package manager" }

      -- ========================================
      -- SPC b — Buffers
      -- ========================================
      n["<Leader>b"] = { desc = "Buffers" }
      n["<Leader>bb"] = { function() Snacks.picker.buffers() end, desc = "List buffers" }
      n["<Leader>bd"] = { function() require("astrocore.buffer").close() end, desc = "Delete buffer" }
      n["<Leader>bn"] = {
        function() require("astrocore.buffer").nav(vim.v.count1) end,
        desc = "Next buffer",
      }
      n["<Leader>bp"] = {
        function() require("astrocore.buffer").nav(-vim.v.count1) end,
        desc = "Previous buffer",
      }
      n["<Leader>bN"] = { "<Cmd>enew<CR>", desc = "New empty buffer" }
      n["<Leader>bs"] = { "<Cmd>enew<CR>", desc = "Scratch buffer" }
      n["<Leader>bm"] = { "<Cmd>messages<CR>", desc = "Messages" }

      -- ========================================
      -- SPC c — Comments (overrides AstroNvim close buffer)
      -- ========================================
      n["<Leader>c"] = { desc = "Comments" }
      n["<Leader>cl"] = { "gcc", desc = "Comment line", remap = true }

      -- ========================================
      -- SPC e — Errors / diagnostics (overrides AstroNvim explorer)
      -- ========================================
      n["<Leader>e"] = { desc = "Errors" }
      n["<Leader>el"] = { function() vim.diagnostic.setloclist() end, desc = "List errors" }
      n["<Leader>en"] = { function() vim.diagnostic.goto_next() end, desc = "Next error" }
      n["<Leader>ep"] = { function() vim.diagnostic.goto_prev() end, desc = "Previous error" }

      -- ========================================
      -- SPC f — Files
      -- ========================================
      n["<Leader>f"] = { desc = "Files" }
      n["<Leader>ff"] = { function() Snacks.picker.files() end, desc = "Find file" }
      n["<Leader>fr"] = { function() Snacks.picker.recent() end, desc = "Recent files" }
      n["<Leader>fs"] = { "<Cmd>w<CR>", desc = "Save file" }
      n["<Leader>fS"] = { "<Cmd>wa<CR>", desc = "Save all files" }
      n["<Leader>ft"] = { "<Cmd>Neotree toggle<CR>", desc = "File tree" }
      n["<Leader>fy"] = {
        function()
          local path = vim.fn.expand("%:p")
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path)
        end,
        desc = "Yank file path",
      }
      n["<Leader>fe"] = { desc = "Editor" }
      n["<Leader>fed"] = { "<Cmd>edit $MYVIMRC<CR>", desc = "Edit config" }

      -- ========================================
      -- SPC g — Git
      -- ========================================
      n["<Leader>g"] = { desc = "Git" }
      n["<Leader>gs"] = { "<Cmd>Neogit kind=tab<CR>", desc = "Git status (Neogit)" }
      n["<Leader>gb"] = {
        function() require("gitsigns").blame_line({ full = true }) end,
        desc = "Blame line",
      }
      n["<Leader>gB"] = { function() Snacks.picker.git_branches() end, desc = "Branches" }
      n["<Leader>gd"] = { function() require("gitsigns").preview_hunk() end, desc = "Diff hunk" }
      n["<Leader>gD"] = { function() require("gitsigns").diffthis() end, desc = "Diff buffer" }
      n["<Leader>gl"] = { function() Snacks.picker.git_log() end, desc = "Git log" }
      n["<Leader>gS"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" }
      n["<Leader>gu"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" }
      n["<Leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" }

      -- ========================================
      -- SPC h — Help
      -- ========================================
      n["<Leader>h"] = { desc = "Help" }
      n["<Leader>hd"] = { desc = "Describe" }
      n["<Leader>hdk"] = { function() Snacks.picker.keymaps() end, desc = "Describe key" }
      n["<Leader>hdf"] = { function() Snacks.picker.help() end, desc = "Describe function" }
      n["<Leader>hm"] = { function() Snacks.picker.man() end, desc = "Man pages" }

      -- ========================================
      -- SPC j — Jump
      -- ========================================
      n["<Leader>j"] = { desc = "Jump" }
      n["<Leader>jj"] = { function() require("flash").jump() end, desc = "Jump to char" }
      n["<Leader>jl"] = {
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        desc = "Jump to line",
      }

      -- ========================================
      -- SPC l — LSP (group label; bindings in astrolsp below)
      -- ========================================
      n["<Leader>l"] = { desc = "LSP" }

      -- ========================================
      -- SPC p — Projects (overrides AstroNvim packages)
      -- ========================================
      n["<Leader>p"] = { desc = "Projects" }
      n["<Leader>pf"] = { function() Snacks.picker.files() end, desc = "Find project file" }
      n["<Leader>pp"] = { function() Snacks.picker.projects() end, desc = "Switch project" }
      n["<Leader>pb"] = { function() Snacks.picker.buffers() end, desc = "Project buffers" }
      n["<Leader>ps"] = { function() Snacks.picker.grep() end, desc = "Search in project" }
      n["<Leader>pt"] = { "<Cmd>Neotree toggle<CR>", desc = "Project tree" }

      -- ========================================
      -- SPC q — Quit
      -- ========================================
      n["<Leader>q"] = { desc = "Quit" }
      n["<Leader>qq"] = { "<Cmd>qa<CR>", desc = "Quit" }
      n["<Leader>qQ"] = { "<Cmd>qa!<CR>", desc = "Quit without saving" }
      n["<Leader>qs"] = { "<Cmd>wqa<CR>", desc = "Save and quit" }

      -- ========================================
      -- SPC s — Search
      -- ========================================
      n["<Leader>s"] = { desc = "Search" }
      n["<Leader>ss"] = { function() Snacks.picker.lines() end, desc = "Search buffer (swiper)" }
      n["<Leader>sp"] = { function() Snacks.picker.grep() end, desc = "Search project" }
      n["<Leader>sr"] = { function() Snacks.picker.resume() end, desc = "Resume last search" }
      n["<Leader>sf"] = { function() Snacks.picker.files() end, desc = "Search files" }
      n["<Leader>sh"] = { function() Snacks.picker.help() end, desc = "Search help" }
      n["<Leader>sw"] = {
        function() Snacks.picker.grep({ search = vim.fn.expand("<cword>") }) end,
        desc = "Search word at point",
      }

      -- ========================================
      -- SPC t — Toggles (overrides AstroNvim terminal group)
      -- ========================================
      n["<Leader>t"] = { desc = "Toggles" }
      n["<Leader>tn"] = {
        function() vim.wo.number = not vim.wo.number end,
        desc = "Toggle line numbers",
      }
      n["<Leader>tr"] = {
        function() vim.wo.relativenumber = not vim.wo.relativenumber end,
        desc = "Toggle relative numbers",
      }
      n["<Leader>tw"] = { "<Cmd>set wrap!<CR>", desc = "Toggle word wrap" }
      n["<Leader>ts"] = { "<Cmd>set spell!<CR>", desc = "Toggle spell check" }
      n["<Leader>th"] = { "<Cmd>nohlsearch<CR>", desc = "Clear search highlight" }
      n["<Leader>tl"] = { "<Cmd>set cursorline!<CR>", desc = "Toggle cursor line" }
      n["<Leader>tc"] = { "<Cmd>set cursorcolumn!<CR>", desc = "Toggle cursor column" }
      n["<Leader>tf"] = {
        function()
          local ok, toggles = pcall(require, "astrolsp.toggles")
          if ok and toggles.buffer_autoformat then
            toggles.buffer_autoformat()
          end
        end,
        desc = "Toggle format on save",
      }

      -- ========================================
      -- SPC w — Windows (overrides AstroNvim save)
      -- ========================================
      n["<Leader>w"] = { desc = "Windows" }
      n["<Leader>wv"] = { "<Cmd>vsplit<CR>", desc = "Split vertical" }
      n["<Leader>w/"] = { "<Cmd>vsplit<CR>", desc = "Split vertical" }
      n["<Leader>ws"] = { "<Cmd>split<CR>", desc = "Split horizontal" }
      n["<Leader>w-"] = { "<Cmd>split<CR>", desc = "Split horizontal" }
      n["<Leader>wd"] = { "<Cmd>close<CR>", desc = "Close window" }
      n["<Leader>wh"] = { "<Cmd>wincmd h<CR>", desc = "Window left" }
      n["<Leader>wj"] = { "<Cmd>wincmd j<CR>", desc = "Window below" }
      n["<Leader>wk"] = { "<Cmd>wincmd k<CR>", desc = "Window above" }
      n["<Leader>wl"] = { "<Cmd>wincmd l<CR>", desc = "Window right" }
      n["<Leader>wH"] = { "<Cmd>wincmd H<CR>", desc = "Move window far left" }
      n["<Leader>wJ"] = { "<Cmd>wincmd J<CR>", desc = "Move window far down" }
      n["<Leader>wK"] = { "<Cmd>wincmd K<CR>", desc = "Move window far up" }
      n["<Leader>wL"] = { "<Cmd>wincmd L<CR>", desc = "Move window far right" }
      n["<Leader>w="] = { "<Cmd>wincmd =<CR>", desc = "Balance windows" }
      n["<Leader>wm"] = {
        function()
          vim.cmd("wincmd _")
          vim.cmd("wincmd |")
        end,
        desc = "Maximize window",
      }
      n["<Leader>ww"] = { "<Cmd>wincmd w<CR>", desc = "Other window" }
      n["<Leader>wo"] = { "<Cmd>only<CR>", desc = "Close other windows" }

      -- ========================================
      -- SPC x — Text manipulation
      -- ========================================
      n["<Leader>x"] = { desc = "Text" }
      n["<Leader>xd"] = { desc = "Delete" }
      n["<Leader>xdw"] = {
        function()
          local save = vim.fn.winsaveview()
          vim.cmd([[keeppatterns %s/\s\+$//e]])
          vim.fn.winrestview(save)
          vim.notify("Trailing whitespace removed")
        end,
        desc = "Delete trailing whitespace",
      }

      -- ========================================
      -- Visual mode
      -- ========================================
      v["<Leader>;"] = { "gc", desc = "Comment selection", remap = true }
      v["<Leader>x"] = { desc = "Text" }
      v["<Leader>xu"] = { "u", desc = "Lowercase" }
      v["<Leader>xU"] = { "U", desc = "Uppercase" }

      -- ========================================
      -- Insert mode — Emacs-style navigation
      -- ========================================
      i["<C-a>"] = { "<Home>", desc = "Beginning of line" }
      i["<C-e>"] = { "<End>", desc = "End of line" }
      i["<C-f>"] = { "<Right>", desc = "Forward char" }
      i["<C-b>"] = { "<Left>", desc = "Backward char" }
      i["<C-d>"] = { "<Del>", desc = "Delete char forward" }
      i["<C-k>"] = { "<C-o>D", desc = "Kill to end of line" }

      -- ========================================
      -- Command-line mode — Emacs-style
      -- ========================================
      c["<C-a>"] = { "<Home>", desc = "Beginning of line" }
      c["<C-e>"] = { "<End>", desc = "End of line" }
      c["<C-f>"] = { "<Right>", desc = "Forward char" }
      c["<C-b>"] = { "<Left>", desc = "Backward char" }
      c["<C-d>"] = { "<Del>", desc = "Delete char forward" }
    end,
  },

  -- ==========================================
  -- LSP-specific keybindings via AstroLSP
  -- ==========================================
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      local maps = opts.mappings
      if not maps then
        maps = {}
        opts.mappings = maps
      end
      maps.n = maps.n or {}
      local n = maps.n

      -- SPC l — LSP bindings (only active when LSP attached)
      n["<Leader>ld"] = { function() vim.lsp.buf.definition() end, desc = "Go to definition" }
      n["<Leader>lD"] = {
        function() vim.lsp.buf.declaration() end,
        desc = "Go to declaration",
        cond = "textDocument/declaration",
      }
      n["<Leader>lr"] = { function() vim.lsp.buf.references() end, desc = "Find references" }
      n["<Leader>lR"] = { function() vim.lsp.buf.rename() end, desc = "Rename symbol" }
      n["<Leader>la"] = { function() vim.lsp.buf.code_action() end, desc = "Code action" }
      n["<Leader>lf"] = {
        function() vim.lsp.buf.format({ async = true }) end,
        desc = "Format buffer",
      }
      n["<Leader>li"] = { function() vim.lsp.buf.hover() end, desc = "Hover info" }
      n["<Leader>ls"] = { function() Snacks.picker.lsp_symbols() end, desc = "Document symbols" }
      n["<Leader>lS"] = {
        function() Snacks.picker.lsp_workspace_symbols() end,
        desc = "Workspace symbols",
      }
      n["<Leader>le"] = { function() Snacks.picker.diagnostics() end, desc = "Diagnostics" }

      -- Classic Vim-style LSP navigation (always available)
      n["gd"] = { function() vim.lsp.buf.definition() end, desc = "Go to definition" }
      n["gr"] = { function() vim.lsp.buf.references() end, desc = "Find references" }
      n["K"] = { function() vim.lsp.buf.hover() end, desc = "Hover info" }
    end,
  },

  -- ==========================================
  -- Neogit — Magit-style Git interface (SPC g s)
  -- ==========================================
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    cmd = "Neogit",
    opts = { integrations = { diffview = true } },
  },

  -- ==========================================
  -- Remove gitsigns buffer-local <Leader>gs
  -- so our global Neogit binding works
  -- ==========================================
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      local orig = opts.on_attach
      opts.on_attach = function(bufnr)
        if orig then orig(bufnr) end
        pcall(vim.keymap.del, "n", "<Leader>gs", { buffer = bufnr })
      end
    end,
  },

  -- ==========================================
  -- Diffview — side-by-side diffs (used by Neogit)
  -- ==========================================
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },

  -- ==========================================
  -- Flash.nvim — jump functionality (SPC j)
  -- ==========================================
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = { enabled = false }, -- keep regular / search as-is
        char = { enabled = false }, -- keep f/t/F/T as vanilla Vim
      },
    },
  },

  -- ==========================================
  -- Better-escape: fd → Esc (Spacemacs default)
  -- ==========================================
  {
    "max397574/better-escape.nvim",
    opts = function()
      return {
        timeout = 200,
        default_mappings = false,
        mappings = {
          i = { f = { d = "<Esc>" }, j = { k = "<Esc>" } },
          c = { f = { d = "<Esc>" }, j = { k = "<Esc>" } },
          t = { f = { d = "<C-\\><C-n>" }, j = { k = "<C-\\><C-n>" } },
          v = { f = { d = "<Esc>" }, j = { k = "<Esc>" } },
          s = { f = { d = "<Esc>" }, j = { k = "<Esc>" } },
        },
      }
    end,
  },
}
