return {
    -- 🐖 This finally managed to get my Rzeka.Tests.csproj be able to detect and code-complete
    -- stuff from the Rzeka.Core.csproj
	-- {
	-- 	"khoido2003/roslyn-filewatch.nvim",
	-- 	build = "nvim -l build.lua --", -- Compiles or downloads the Native Rust module fallback
	-- 	config = function()
	-- 		require("roslyn_filewatch").setup()
	-- 	end,
	-- },
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
					local opts = { buffer = bufnr }
					vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
					--                     vim.keymap.set('n', 'gr', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
					-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
					vim.keymap.set("n", "KK", vim.diagnostic.open_float, { desc = "Show diagnostics" })
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					["csharp|formatting"] = {
						dotnet_organize_imports_on_format = true,
					},
					["csharp|background_analysis"] = {
						dotnet_analyzer_diagnostics_scope = "fullSolution",
						dotnet_compiler_diagnostics_scope = "fullSolution",
					},
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,
						csharp_enable_inlay_hints_for_lambda_parameter_types = true,
						csharp_enable_inlay_hints_for_types = true,
						dotnet_enable_inlay_hints_for_indexer_parameters = true,
						dotnet_enable_inlay_hints_for_literal_parameters = true,
						dotnet_enable_inlay_hints_for_object_creation_parameters = true,
						dotnet_enable_inlay_hints_for_other_parameters = true,
						dotnet_enable_inlay_hints_for_parameters = true,
						dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
					},
					["csharp|symbol_search"] = {
						dotnet_search_reference_assemblies = true,
					},
					["csharp|completion"] = {
						dotnet_show_name_completion_suggestions = true,
						dotnet_show_completion_items_from_unimported_namespaces = true,
						dotnet_provide_regex_completions = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			})

			vim.lsp.enable("roslyn")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}
