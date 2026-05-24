return {
	-- Everforest theme by sainnhe — soft, warm forest palette.
	-- https://github.com/sainnhe/everforest
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- These globals must be set BEFORE :colorscheme is invoked.
			-- The actual `:colorscheme` call lives at the end of init.lua so the active theme is
			-- easy to find and swap in one place.
			-- NOTE: `everforest_better_performance` (compiled cache) is intentionally OFF.
			-- With it enabled, switching between everforest-hard/medium/soft can serve a stale cached version.
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_virtual_text = "colored"
		end,
	},
}
