return {

  { "christoomey/vim-tmux-navigator", },

  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/oil.nvim",
    lazy = false;
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,

          ["<M-h>"] = "actions.select_split",

          ["."]     = "actions.toggle_hidden",
        },

        view_options = {
          show_hidden = false,
        }
      }
    end
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require("harpoon")
      harpoon:setup()
    end
  },

}
