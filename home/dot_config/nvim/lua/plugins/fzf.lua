return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Help tags" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files" },
    { "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Document diagnostics" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document symbols" },
    { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "Grep word under cursor" },
    { "<leader>/", "<cmd>FzfLua grep_curbuf<CR>", desc = "Search in current buffer" },
    { "<leader><leader>", "<cmd>FzfLua files<CR>", desc = "Find files" },
  },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = {
        layout = "vertical",
        vertical = "up:40%",
      },
    },
  },
}
