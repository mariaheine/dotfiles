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
	-- 🐖 VERY IMPORTANT
	-- you might have weird problems when your max_user_watchers are set too low
	-- and by default on most distros they are pretty low
	-- see notes in linux fundamentals about inotfy
	{
		-- https://github.com/seblyng/roslyn.nvim
		-- Das Plugin kann hervorragend mit Projekten umgehen, die mehrere .sln-Dateien haben. Mit :Roslyn target kannst du die aktive Solution wechseln.
		"seblyng/roslyn.nvim",

		-- 🐖 don't remove these two!
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- see possible options here: https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
			broad_search = false, -- Rzeka.slnx is at the root, upward search is enough
			filewatching = "off", -- Let Roslyn handle file watching, more reliable cross-project
		},

		config = function(_, opts)
			require("roslyn").setup(opts)

			-- Hier kannst du LSP-spezifische Einstellungen für Roslyn vornehmen.
			-- Diese werden über die standard vim.lsp.config-Schnittstelle konfiguriert.
			-- Roslyn binary lives in Mason's libexec/ which isn't on $PATH, and roslyn.nvim only
			-- searches $PATH for "Microsoft.CodeAnalysis.LanguageServer". Point it at the binary directly.
			-- Roslyn's server also REQUIRES --logLevel and --extensionLogDirectory; missing either makes it exit 1.
			local roslyn_bin = vim.fn.stdpath("data")
				.. "/mason/packages/roslyn/libexec/Microsoft.CodeAnalysis.LanguageServer"
			local roslyn_log_dir = vim.fn.stdpath("log") .. "/roslyn"
			vim.fn.mkdir(roslyn_log_dir, "p")

			vim.lsp.config("roslyn", {
				cmd = {
					roslyn_bin,
					"--logLevel=Information",
					"--extensionLogDirectory=" .. roslyn_log_dir,
					"--stdio",
				},
				on_attach = function(client, bufnr)
					local opts = { buffer = bufnr }
					vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
					--                     vim.keymap.set('n', 'gr', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
					-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
					vim.keymap.set("n", "KK", vim.diagnostic.open_float, { desc = "Show diagnostics" })
					vim.keymap.set("n", "grx", "<cmd>Telescope diagnostics<cr>", { desc = "Browse diagnostics", buffer = bufnr })
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

			-- Fix partial C# colouring in splits/tabs opened before the solution finishes loading.
			-- Roslyn returns EMPTY semantic tokens (method/field/property colours) for a document
			-- until its project is loaded, and a buffer opened during that window never retries — so
			-- only the first file you sit on long enough gets full colouring. roslyn.nvim fires this
			-- User event (with the client id) the moment the server reports the solution is fully
			-- initialised, so we re-request tokens for every buffer on that client. Late-opened splits
			-- then light up automatically instead of staying stuck on Treesitter-only.
			vim.api.nvim_create_autocmd("User", {
				pattern = "RoslynInitialized",
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data and args.data.client_id)
					if not client then
						return
					end
					for buf in pairs(client.attached_buffers or {}) do
						if vim.api.nvim_buf_is_valid(buf) then
							vim.lsp.semantic_tokens.force_refresh(buf)
						end
					end
				end,
			})
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}
