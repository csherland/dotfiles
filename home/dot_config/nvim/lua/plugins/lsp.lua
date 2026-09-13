-- Servers not covered by a LazyVim lang extra. lua_ls, vtsls, jsonls, yamlls,
-- pyright/ruff, gopls, rust_analyzer and dockerls come from the extras in lazy.lua.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        html = {},
        cssls = {},
      },
    },
  },

  -- nvim-treesitter (main) needs the tree-sitter CLI to build parsers; LazyVim's health check wants it too
  { "mason-org/mason.nvim", opts = { ensure_installed = { "tree-sitter-cli" } } },
}
