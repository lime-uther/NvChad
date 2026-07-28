require "nvchad.mappings"

local harpoon = require("harpoon")
local tel_actions = require("telescope.actions")

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":",        { desc = "CMD enter command mode" })
map("n", "-", ":Oil<CR>", { desc = "Open parent directory", silent = true })

unmap("i", "<C-h>")
unmap("i", "<C-j>")
unmap("i", "<C-k>")
unmap("i", "<C-l>")

map("n", "<C-M-h>", "zH", { desc = "Scroll half-page left"})
map("n", "<C-M-l>", "zL", { desc = "Scroll half-page right"})

map("n", "C-h", ":TmuxNavigateLeft<CR>"  )
map("n", "C-j", ":TmuxNavigateDown<CR>"  )
map("n", "C-k", ":TmuxNavigateUp<CR>"    )
map("n", "C-l", ":TmuxNavigateRight<CR>" )

map("n", "<A-1>", function() harpoon:list():select(1) end)
map("n", "<A-2>", function() harpoon:list():select(2) end)
map("n", "<A-3>", function() harpoon:list():select(3) end)
map("n", "<A-4>", function() harpoon:list():select(4) end)

map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<C-e>"    , function()
  harpoon.ui:toggle_quick_menu(harpoon:list(), {
    title = " Harpoon ",
    ui_width_ratio = 0.4,
    border = "none"
  })
end)

map("n", "<leader>cd", function()
  local current_dir = vim.fn.expand("%:p:h")
  local cmd = "git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel"
  local root = vim.fn.systemlist(cmd)[1]

  -- if no git repository directory could be found
  if not (vim.v.shell_error == 0 and root and root ~= "") then
    root = current_dir
  end

  root = string.gsub(root, "^oil://", "")

  vim.fn.chdir(root)
  vim.notify("Changed directory to: " .. root, vim.log.levels.INFO)
end)

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = tel_actions.move_selection_next,
        ["<C-k>"] = tel_actions.move_selection_previous,
        ["<C-n>"] = tel_actions.select_default,
      }
    }
  }
})

