return {
	-- Moonlight theme by shaunsingh.
	-- https://github.com/shaunsingh/moonlight.nvim
	-- Configured through vim.g globals (no setup() table); provides the `moonlight` colorscheme.
	{
		"shaunsingh/moonlight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.moonlight_italic_comments = false
			vim.g.moonlight_italic_keywords = false
			vim.g.moonlight_italic_functions = false
			vim.g.moonlight_italic_variables = false
			vim.g.moonlight_contrast = true
			vim.g.moonlight_borders = false
			vim.g.moonlight_disable_background = false
			-- We DON'T activate it here — everforest is the active theme.
			-- Switch on demand with `:colorscheme moonlight`.
		end,
	},
}
