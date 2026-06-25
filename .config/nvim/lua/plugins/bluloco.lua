return {
	-- Bluloco theme by uloco.
	-- https://github.com/uloco/bluloco.nvim
	-- Built on lush.nvim (required dependency). Provides bluloco, bluloco-dark
	-- and bluloco-light colorschemes; `style` below picks the default variant.
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		opts = {
			style = "dark", -- "dark" | "light"
			transparent = false,
			italics = false,
		},
		-- Setup runs but we DON'T call `:colorscheme bluloco` here — everforest is the active theme.
		-- Switch on demand with `:colorscheme bluloco` (or `bluloco-dark` / `bluloco-light`).
		config = function(_, opts)
			require("bluloco").setup(opts)
		end,
	},
}
