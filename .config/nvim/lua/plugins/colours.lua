return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha", -- latte (light), frappe, macchiato, mocha (darkest)
			-- Each integration teaches catppuccin how to colour a specific plugin's UI.
			-- Without these, plugins fall back to generic highlight groups and may look mismatched.
			integrations = {
				cmp = true,
				treesitter = true,
				rainbow_delimiters = true,
				telescope = { enabled = true },
				mason = true,
				which_key = true,
				noice = true,
				nvimtree = true,
				render_markdown = true,
				snacks = { enabled = true, indent_scope_color = "lavender" },
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
			},
		},
		-- Setup runs but we DON'T call `:colorscheme catppuccin` here — everforest is the active theme.
		-- You can switch on demand with `:colorscheme catppuccin` (or `:colorscheme everforest`).
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
}
