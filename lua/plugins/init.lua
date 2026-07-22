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
          ["<C-s>"] = false,

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
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-p>"]     = nil,
        ["<C-space>"] = nil,
        ["<Tab>"]     = nil,
        ["<S-Tab>"]   = nil,
        ["<C-y>"]     = cmp.mapping.complete(),
        ["<C-n>"]     = cmp.mapping.confirm { select = true },
        ["<C-k>"]     = cmp.mapping.select_prev_item(),
        ["<C-j>"]     = cmp.mapping.select_next_item(),
        ["<C-d>"]     = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]     = cmp.mapping.scroll_docs(4),
        ["<C-e>"]     = cmp.mapping.abort(),
      })

      return opts
    end,
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
