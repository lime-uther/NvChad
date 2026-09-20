return {
  cmd = {
    "arduino-language-server",
    "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
    "-cli", "arduino-cli",
    "-clangd", "clangd"
  },
}

