return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { 'gd', vim.lsp.buf.definition }
  end,
  opts = {
    autoformat = false,
    servers = {
      clangd = { mason = false },
      bashls = {},
      rust_analyzer = {},
      cmake = {
        settings = {
          cmake = {
            initializationOptions = {
              buildDirectory = "local_build",
            },
          },
        },
      },
      gopls = {},
    },
  },
}
