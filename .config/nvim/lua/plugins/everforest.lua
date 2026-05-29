return {
	-- Everforest theme — Lua port by neanias.
	-- https://github.com/neanias/everforest-nvim
	-- Cleaner Lua API + setup() deep-merges options, so the colors/everforest-*.lua aliases work reliably.
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		version = false, -- always pull latest commit on the default branch
		config = function()
			require("everforest").setup({
				background = "hard", -- "hard" | "medium" | "soft" (alias files override this)
				italics = false,
				diagnostic_text_highlight = true,
				diagnostic_virtual_text = "coloured",
				ui_contrast = "low",
				float_style = "bright",
			})
		end,
	},
}
