return {
	-- Tokyo Night theme by folke.
	-- https://github.com/folke/tokyonight.nvim
	-- Ships several styles as separate colorschemes: tokyonight-night (darkest),
	-- tokyonight-storm, tokyonight-moon, tokyonight-day (light).
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night", -- night | storm | moon | day
			-- Integrations are auto-detected from installed plugins, so we only
			-- override behaviour rather than enabling each plugin by hand.
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		},
		-- Setup runs but we DON'T call `:colorscheme tokyonight` here — everforest is the active theme.
		-- Switch on demand with `:colorscheme tokyonight` (or a specific style like `tokyonight-storm`).
		config = function(_, opts)
			require("tokyonight").setup(opts)
		end,
	},
}
