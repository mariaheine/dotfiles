return {
	-- Floating UI for cmdline, :messages, LSP hover/signature/progress.
	-- https://github.com/folke/noice.nvim
	-- Plays nicely alongside snacks.notifier (which keeps owning vim.notify routing).
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim", -- UI primitives required by noice
		},
		opts = {
			lsp = {
				-- Use treesitter to syntax-highlight code blocks inside hovers/signatures.
				-- Without this, C# signatures and types in K-hover popups render as plain text.
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = { enabled = true },
				signature = { enabled = true },
				progress = { enabled = true }, -- spinner in the corner while LSP indexes / works
			},
			presets = {
				bottom_search = true,         -- keep `/` and `?` at the bottom (classic Vim feel)
				command_palette = true,       -- combine cmdline + completion popup into one floating box at top
				long_message_to_split = true, -- long :messages / :checkhealth output opens in a split
				lsp_doc_border = true,        -- rounded borders on LSP hover/signature popups
			},
			-- Route notifications through vim.notify (which snacks.notifier owns).
			notify = {
				enabled = true,
				view = "notify",
			},
		},
	},
}
