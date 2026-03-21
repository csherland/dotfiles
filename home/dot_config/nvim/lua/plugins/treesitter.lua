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
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})

			-- Auto-install parsers if missing
			local ensure = {
				"bash",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
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
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Select outer function" },
							["if"] = { query = "@function.inner", desc = "Select inner function" },
							["ac"] = { query = "@class.outer", desc = "Select outer class" },
							["ic"] = { query = "@class.inner", desc = "Select inner class" },
							["aa"] = { query = "@parameter.outer", desc = "Select outer argument" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner argument" },
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = { query = "@function.outer", desc = "Next function start" },
							["]]"] = { query = "@class.outer", desc = "Next class start" },
						},
						goto_next_end = {
							["]M"] = { query = "@function.outer", desc = "Next function end" },
							["]["] = { query = "@class.outer", desc = "Next class end" },
						},
						goto_previous_start = {
							["[m"] = { query = "@function.outer", desc = "Previous function start" },
							["[["] = { query = "@class.outer", desc = "Previous class start" },
						},
						goto_previous_end = {
							["[M"] = { query = "@function.outer", desc = "Previous function end" },
							["[]"] = { query = "@class.outer", desc = "Previous class end" },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next argument" },
						},
						swap_previous = {
							["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous argument" },
						},
					},
				},
			})
		end,
	},

	-- Fix comment syntax for JSX/TSX, JSON, etc.
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
