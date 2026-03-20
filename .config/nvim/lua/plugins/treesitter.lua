-- eturn {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	event = { "BufReadPost", "BufNewFile" },
-- 	dependencies = {
-- 		"nvim-treesitter/nvim-treesitter-textobjects",
-- 	},
-- 	config = function()
-- 		local config = require("nvim-treesitter.configs")
-- 		config.setup({
-- 			-- Auto-install parsers for languages you open
-- 			auto_install = true,
-- 			sync_install = false,
--
-- 			-- Syntax highlighting
-- 			highlight = {
-- 				enable = true,
-- 				additional_vim_regex_highlighting = false,
-- 			},
--
-- 			-- THIS HELPS WITH YOUR INDENT LINES ISSUE!
-- 			indent = {
-- 				enable = true,
-- 			},
--
-- 			-- Powerful navigation and selection
-- 			textobjects = {
-- 				move = {
-- 					enable = true,
-- 					set_jumps = true,
-- 					goto_next_start = {
-- 						["]m"] = "@function.outer",
-- 						["]c"] = "@class.outer",
-- 					},
-- 					goto_next_end = {
-- 						["]M"] = "@function.outer",
-- 						["]C"] = "@class.outer",
-- 					},
-- 				},
-- 				select = {
-- 					enable = true,
-- 					lookahead = true,
-- 					keymaps = {
-- 						["af"] = "@function.outer",
-- 						["if"] = "@function.inner",
-- 						["ac"] = "@class.outer",
-- 						["ic"] = "@class.inner",
-- 						["ab"] = "@block.outer",
-- 						["ib"] = "@block.inner",
-- 						["aP"] = "@parameter.outer",
-- 						["iP"] = "@parameter.inner",
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		auto_install = true,
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
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
	-- This automatically runs the setup with the above opts
}
