-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "folke/todo-comments.nvim", opts = {} },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
    { "folke/which-key.nvim", lazy = true },
    { "nvim-neorg/neorg", ft = "norg", opts = { load = { ["core.defaults"] = {}, }, }, },
    { "dstein64/vim-startuptime", cmd = "StartupTime", init = function() vim.g.startuptime_tries = 10 end, },
    { "hrsh7th/nvim-cmp", event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- ...
    end,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { "Wansmer/treesj", keys = { { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" }, },
	opts = { use_default_keymaps = false, max_join_length = 150 },
    },
    { "monaqa/dial.nvim", keys = { "<C-a>", { "<C-x>", mode = "n" } }, },
    {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
	    "nvim-lua/plenary.nvim",
	    "nvim-tree/nvim-web-devicons", 
	    "MunifTanjim/nui.nvim",
	    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
    }
  },
  checker = { enabled = true },
})
