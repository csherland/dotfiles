-- Add a macro-recording indicator and attached LSP client names to LazyVim's lualine.
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, 1, {
      function()
        local reg = vim.fn.reg_recording()
        return reg ~= "" and ("recording @" .. reg) or ""
      end,
      color = function()
        return { fg = Snacks.util.color("DiagnosticError") }
      end,
    })
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local names = vim.tbl_map(function(c)
          return c.name
        end, vim.lsp.get_clients({ bufnr = 0 }))
        return #names > 0 and (" " .. table.concat(names, ", ")) or ""
      end,
    })
  end,
}
