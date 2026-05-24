return {
	-- Folke's all-in-one quality-of-life plugin collection.
	-- https://github.com/folke/snacks.nvim
	-- Only the modules listed in `opts` are loaded; everything else stays dormant.
	-- NOTE: `picker` and `explorer` are intentionally NOT enabled — telescope + nvim-tree stay in charge.
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- Pretty floating notifications. Replaces nvim-notify.
			-- snacks.notifier auto-installs itself as vim.notify, so :checkhealth / LSP / lazy.nvim
			-- messages all flow through here.
			notifier = {
				enabled = true,
				timeout = 3000,
				icons = {
					error = "󰅚",
					warn = "󰀪",
					info = "󰋼",
					debug = "󰌵",
					trace = "",
				},
			},

			-- Indent guides: show ONLY the current block's scope, not all indent levels.
			indent = {
				enabled = true,
				indent = {
					enabled = false, -- turn off the always-on guides for every level
				},
				scope = {
					enabled = true,
					char = "│",
					underline = false,
					only_current = false, -- show scope guide even when buffer is unfocused
				},
			},

			-- Splash dashboard shown when nvim opens with no file argument.
			dashboard = { enabled = true },

			-- Smooth animated scrolling for <C-d>/<C-u>/zz/zb/zt etc.
			scroll = { enabled = true },

			-- Highlight all references to the word/symbol under the cursor (uses LSP).
			words = { enabled = true },

			-- Replaces the ugly default vim.ui.input prompt with a small floating window.
			-- Things like LSP rename, :IncRename, and any plugin using vim.ui.input benefit.
			input = { enabled = true },

			-- Detects very large files on open and disables syntax/LSP/treesitter to keep things snappy.
			bigfile = { enabled = true },

			-- Renders the first screen of a file before the rest is parsed — faster perceived load.
			quickfile = { enabled = true },

			-- Combined statuscolumn: line number + sign column + fold indicators in one tidy column.
			statuscolumn = { enabled = true },
		},
	},
}
