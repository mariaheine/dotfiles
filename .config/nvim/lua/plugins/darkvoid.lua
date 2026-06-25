return {
	-- DarkVoid theme.
	-- https://github.com/darkvoid-theme/darkvoid.nvim
	-- Minimal grayscale-leaning dark theme; registers the `darkvoid` colorscheme.
	{
		"darkvoid-theme/darkvoid.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("darkvoid").setup({
				transparent = false,
				glow = false, -- subtle glow/blur effect on some groups
				show_end_of_buffer = true,
			})
			-- Setup runs but we DON'T activate it — the saved/default theme wins (see init.lua).
			-- Switch on demand with `:colorscheme darkvoid` or the picker (<leader>ct).
		end,
	},
}
