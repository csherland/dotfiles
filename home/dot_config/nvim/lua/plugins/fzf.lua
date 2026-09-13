-- fzf-lua is set up by the editor.fzf extra; this adds layout tweaks and a few
-- personal keys on top of LazyVim's <leader>s* / <leader>f* defaults.
return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = { layout = "vertical", vertical = "up:40%" },
    },
  },
  keys = {
    { "<leader>fg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" }, -- LazyVim default: git files
    { "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Document diagnostics" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document symbols" },
    { "<leader>fw", LazyVim.pick("grep_cword"), desc = "Grep word under cursor" },
    { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Help tags" },
  },
}
