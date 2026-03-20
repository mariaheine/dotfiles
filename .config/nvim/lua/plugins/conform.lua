return {
	-- Code formatting
	-- https://github.com/stevearc/conform.nvim
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			-- 🐖 Add a formatter here and don't forget to add it in 'mason.lua' autoinstaller

			-- Otherwise you would need to run installations for each formatter tool here:
			-- pip install black
			-- apt install shfmt
			-- etc
			-- or through Mason by:
			-- :MasonInstall black, csharpier etc.

			-- python
			python = { "black" },
			-- bash
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },
			-- lua
			lua = { "stylua" },
			-- c#
			cs = { "csharpier" },
		},
		-- As it says, format on save
		-- Can be configgured otherwise
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
