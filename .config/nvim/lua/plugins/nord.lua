return {
	-- Nord theme by shaunsingh.
	-- https://github.com/shaunsingh/nord.nvim
	-- Configured through vim.g globals (no setup() table); registers the `nord` colorscheme.
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_cursorline_transparent = false
			vim.g.nord_enable_sidebar_background = false
			vim.g.nord_italic = false
			vim.g.nord_bold = true
			vim.g.nord_uniform_diff_background = false
			-- We DON'T activate it here — the saved/default theme wins (see init.lua).
			-- Switch on demand with `:colorscheme nord` or the picker (<leader>ct).
		end,
	},
}
