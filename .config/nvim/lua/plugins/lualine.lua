return {
	-- Statusline at the bottom of Neovim.
	-- https://github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto", -- picks up your active colorscheme (everforest / catppuccin)
				globalstatus = true, -- one global statusline at the bottom instead of one per window
				-- Powerline-style separators (require a nerd font, which you have via web-devicons)
				section_separators = { left = "", right = "" },
				component_separators = { left = "│", right = "│" },
				-- Don't render lualine on these special buffers
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter", "snacks_dashboard" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					-- Parent directory portion of the file's relative path, dimmed.
					-- e.g. "scenes/ui/" — provides "where am I" context without competing with the filename.
					{
						function()
							local path = vim.fn.expand("%:.:h") -- relative dir of current file
							if path == "" or path == "." then
								return ""
							end
							return path .. "/"
						end,
						color = { fg = "#7a8478", gui = "italic" }, -- everforest dim grey
						padding = { left = 1, right = 0 },
					},
					-- The actual filename, bold + bright, no path noise.
					{
						"filename",
						path = 0, -- filename only (parent path is rendered by the component above)
						color = { fg = "#d3c6aa", gui = "bold" }, -- everforest cream
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
						padding = { left = 0, right = 1 },
					},
					"diagnostics",
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			-- Per-buffer styling so things like nvim-tree, lazy, mason get their own clean statusline
			extensions = { "nvim-tree", "lazy", "mason" },
		},
	},
}
