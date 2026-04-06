-- by https://github.com/MoaidHathot/Neovim-Moaid/blob/main/config/nvim/lua/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	-- This automatically runs the setup with the below opts
	opts = {
		-- Auto installing parsers
		auto_install = true,
		sync_install = false,

		ensure_installed = {
			"markdown",
			"markdown_inline",
			"typescript",
			"tsx",
			"javascript",
			"jsdoc",
			"html",
			"css",
			"json",
			"jsonc",
		},

		-- Syntax highlighting
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

		-- Indentation, i am not sure how it works with relation to 'indent.lua'
		indent = {
			enable = true,
		},

		-- Navigation
		textobjects = {
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = "@function.outer",
					["]c"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]C"] = "@class.outer",
				},
			},
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["aP"] = "@parameter.outer",
					["iP"] = "@parameter.inner",
				},
			},
		},
	},
}
