local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
  -- Install formatters/linters via mason (mason-lspconfig only handles LSP servers)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = { "stylua", "prettierd", "eslint_d" },
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        json = prettier,
        jsonc = prettier,
        css = prettier,
        html = prettier,
        markdown = prettier,
        yaml = prettier,
      },
      -- "fallback": LSP formatting is used only for filetypes with no formatter above
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      -- Only run eslint_d in projects that actually have an eslint config
      local eslint_configs = {
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        "eslint.config.ts",
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
      }
      local function has_eslint_config()
        return vim.fs.find(eslint_configs, { path = vim.api.nvim_buf_get_name(0), upward = true })[1] ~= nil
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          if vim.bo.buftype ~= "" then
            return
          end
          local linters = lint.linters_by_ft[vim.bo.filetype]
          if linters and vim.tbl_contains(linters, "eslint_d") and not has_eslint_config() then
            return
          end
          lint.try_lint()
        end,
      })
    end,
  },
}
