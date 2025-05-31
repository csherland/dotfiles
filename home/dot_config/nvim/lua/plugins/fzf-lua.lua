return {
	"ibhagwan/fzf-lua",
	opts = {
		oldfiles = {
			-- Include buffers from current session when using <leader>fr
			include_current_session = true,
		},
		previewers = {
			builtin = {
				-- Limit syntax highlighting to small files (<100KB)
				syntax_limit_b = 1024 * 100, -- 100KB
			},
		},
		grep = {
			-- One thing I missed from Telescope was the ability to live_grep and the
			-- run a filter on the filenames.
			-- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
			-- With this change, I can sort of get the same behaviour in live_grep.
			-- ex: > enable --*/plugins/*
			-- I still find this a bit cumbersome. There's probably a better way of doing this.
			rg_glob = true, -- enable glob parsing
			glob_flag = "--iglob", -- case insensitive globs
			glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
		},
	},
}
