return {
	-- Rainbow-coloured bracket/parenthesis pairs (treesitter-powered).
	-- https://github.com/HiPhish/rainbow-delimiters.nvim
	-- Each nesting level gets a different colour, making deeply-nested code easier to scan.
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
