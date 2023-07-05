return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      clangd = { mason = false },
      bashls = {},
      rust_analyzer = {},
      cmake = {},
      gopls = {},
    },
  },
}
