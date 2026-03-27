return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│" }, -- Uses a thin vertical line character
			whitespace = {
				remove_blankline_trail = false, -- Keeps guides on blank lines
			},
		},
	},
}
