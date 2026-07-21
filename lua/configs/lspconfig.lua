require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "bashls",
  "lua_ls",
  "texlab",
  "ts_ls",
  "qmlls",
  "nil_ls",
}

vim.lsp.config("*")
vim.lsp.enable(servers)
