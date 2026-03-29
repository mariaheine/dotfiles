return {
	{
		"rcarriga/nvim-notify",
		opts = {
			-- Deine Konfiguration
			timeout = 3000, -- 3 Sekunden sichtbar
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			-- Schönere Icons für verschiedene Ebenen
			icons = {
				ERROR = "󰅚",
				WARN = "󰀪",
				INFO = "󰋼",
				DEBUG = "󰌵",
				TRACE = "",
			},
			-- Stil: "default", "minimal", "compact", "wrapped-compact", "wrapped-default"
			render = "wrapped-compact",
			-- Animationen: "fade", "slide", "fade_in_slide_out", "static"
			stages = "fade_in_slide_out",
		},
		init = function()
			-- Das ist der wichtigste Teil: nvim-notify als standard notify setzen!
			vim.notify = require("notify")
		end,
	},
}
