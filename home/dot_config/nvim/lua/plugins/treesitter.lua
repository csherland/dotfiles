return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter").setup({})

      -- Enable treesitter highlighting for all filetypes with an available parser
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- Auto-install parsers if missing
      local ensure = {
        "bash",
        "css",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex", -- required by noice
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }
      local missing = vim.tbl_filter(function(p)
        return not pcall(vim.treesitter.language.inspect, p)
      end, ensure)
      if #missing > 0 then
        vim.cmd("TSInstall " .. table.concat(missing, " "))
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      -- The main branch no longer reads keymaps from setup(); bind them explicitly.
      local map = vim.keymap.set
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      local function sel(query, desc)
        return function()
          select.select_textobject(query, "textobjects")
        end, { desc = desc }
      end

      map({ "x", "o" }, "af", sel("@function.outer", "Select outer function"))
      map({ "x", "o" }, "if", sel("@function.inner", "Select inner function"))
      map({ "x", "o" }, "ac", sel("@class.outer", "Select outer class"))
      map({ "x", "o" }, "ic", sel("@class.inner", "Select inner class"))
      map({ "x", "o" }, "aa", sel("@parameter.outer", "Select outer argument"))
      map({ "x", "o" }, "ia", sel("@parameter.inner", "Select inner argument"))

      local function mv(fn, query, desc)
        return function()
          move[fn](query, "textobjects")
        end, { desc = desc }
      end

      -- ]] / [[ are used by Snacks.words; classes live on ]c / [c (git hunks moved to ]h / [h)
      map({ "n", "x", "o" }, "]m", mv("goto_next_start", "@function.outer", "Next function start"))
      map({ "n", "x", "o" }, "]M", mv("goto_next_end", "@function.outer", "Next function end"))
      map({ "n", "x", "o" }, "[m", mv("goto_previous_start", "@function.outer", "Previous function start"))
      map({ "n", "x", "o" }, "[M", mv("goto_previous_end", "@function.outer", "Previous function end"))
      map({ "n", "x", "o" }, "]c", mv("goto_next_start", "@class.outer", "Next class start"))
      map({ "n", "x", "o" }, "]C", mv("goto_next_end", "@class.outer", "Next class end"))
      map({ "n", "x", "o" }, "[c", mv("goto_previous_start", "@class.outer", "Previous class start"))
      map({ "n", "x", "o" }, "[C", mv("goto_previous_end", "@class.outer", "Previous class end"))

      map("n", "<leader>a", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap with next argument" })
      map("n", "<leader>A", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Swap with previous argument" })
    end,
  },

  -- Fix comment syntax for JSX/TSX, JSON, etc.
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
