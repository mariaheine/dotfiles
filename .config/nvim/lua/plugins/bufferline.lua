return {
	-- Top buffer tab bar with icons, modified indicators, diagnostics, and click-to-switch.
	-- https://github.com/akinsho/bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			options = {
				mode = "tabs", -- show vim tabs (workspaces) instead of every open buffer
				diagnostics = "nvim_lsp",
				-- Per-tab diagnostic count across all buffers in that tab.
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " "
						or level:match("warning") and " "
						or " "
					return " " .. icon .. count
				end,
				-- Reserve space on the left for nvim-tree so opening the explorer doesn't
				-- push tabs around.
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				separator_style = "thin", -- "slant" | "thick" | "thin" | "padded_slant"
				show_buffer_close_icons = true,
				show_close_icon = false,
				color_icons = true,
				always_show_bufferline = true,
			},
		},
		keys = {
			-- Quick tab cycling. Overrides Vim's built-in H / L motions
			-- (jump to top / bottom of window) — use `gg`/`G` or scroll for that instead.
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous tab" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },

			-- Jump to a specific tab by its visible position (1-5).
			{ "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Tab 1" },
			{ "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Tab 2" },
			{ "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Tab 3" },
			{ "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Tab 4" },
			{ "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Tab 5" },
			-- Tab create / close / next / prev already live in init.lua as <Leader>tf/tc/tn/tp.
		},
	},
}
