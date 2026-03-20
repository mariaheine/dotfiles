return {
	{
		-- https://github.com/seblyng/roslyn.nvim
		-- Das Plugin kann hervorragend mit Projekten umgehen, die mehrere .sln-Dateien haben. Mit :Roslyn target kannst du die aktive Solution wechseln.
		"seblyng/roslyn.nvim",

		-- 🐖 don't remove these two!
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- see possible options here: https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
			broad_search = true, -- Nützlich für Projekte ohne .sln-Datei im Wurzelverzeichnis.
			filewatching = "auto",
		},

		config = function(_, opts)
			require("roslyn").setup(opts)

			-- Hier kannst du LSP-spezifische Einstellungen für Roslyn vornehmen.
			-- Diese werden über die standard vim.lsp.config-Schnittstelle konfiguriert.
			vim.lsp.config("roslyn", {
				on_attach = function(client, bufnr)
					-- Deine on_attach-Funktion (z.B. mit Keymaps)
					local opts = { buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					-- ... alle anderen Keymaps ...
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					-- Hier können spezifische Roslyn/C#-Einstellungen gesetzt werden (siehe README)
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
					["csharp|formatting"] = {
						dotnet_organize_imports_on_format = true,
					},
				},
			})

			-- Wichtig: Der Server muss über den Namen "roslyn" aktiviert werden, den wir gerade konfiguriert haben.
			vim.lsp.enable("roslyn")
		end,
		dependencies = {
			-- Stelle sicher, dass die Completion-Dependency geladen ist, falls du die Capabilities oben verwendest.
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}
