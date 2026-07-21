require "nvchad.mappings"

local harpoon = require("harpoon")
local map = vim.keymap.set

map("n", ";", ":",        { desc = "CMD enter command mode" })
map("n", "-", ":Oil<CR>", { desc = "Open parent directory"})

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
    ui_width_ratio = 0.4
  })
end)
