return {
	-- Aquavium theme.
	-- https://github.com/T-b-t-nchos/Aquavium.nvim
	-- Note the capitalised module/colorscheme name: `Aquavium`. Requires Neovim 0.11+.
	{
		"T-b-t-nchos/Aquavium.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("Aquavium").setup({
				bold = true,
				italic = false,
				transparent = true,
			})
			-- Setup runs but we DON'T activate it — the saved/default theme wins (see init.lua).
			-- Switch on demand with `:colorscheme Aquavium` or the picker (<leader>ct).

			-- Make the column-100 marker (vim.opt.colorcolumn in init.lua) truly transparent — but
			-- ONLY while Aquavium is active. With bg = NONE the column stops painting a fill, so the
			-- terminal/wallpaper shows straight through it. Loading any colorscheme resets highlight
			-- groups, so we re-apply on each ColorScheme event scoped to the Aquavium pattern.
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "Aquavium",
				callback = function()
					vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE" })

					-- Make C# class names share the property colour. Roslyn assigns these via LSP
					-- semantic tokens, so we link the class group to the property group — classes then
					-- resolve to whatever colour properties use, even if Aquavium changes it later.
					vim.api.nvim_set_hl(0, "@lsp.type.class.cs", { link = "@lsp.type.property.cs" })

					-- Colour library/extension methods (.Where, .Select, .SelectMany, …) the same as
					-- plain instance methods (.Loom, .Ask). Roslyn tags extension/BCL methods with the
					-- `static`/`defaultLibrary` modifiers, which land on higher-priority typemod groups
					-- the theme tints differently. Link them back to the plain method group so every
					-- method call reads the same colour.
					vim.api.nvim_set_hl(0, "@lsp.typemod.method.static.cs", { link = "@lsp.type.method.cs" })
					vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.cs", { link = "@lsp.type.method.cs" })
				end,
			})
		end,
	},
}
