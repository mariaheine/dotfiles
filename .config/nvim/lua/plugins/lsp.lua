return {
	-- 🐖 To add a new lsp server you must first go to 'mason.lua'
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- see ":help lsp" for lots of interesting information

			local vim = vim

			-- this is installed in 'completion.lua'
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- adding keymaps when attaching
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end

			-- Python
			vim.lsp.config["basedpyright"] = {
				cmd = { "basedpyright-langserver", "--stdio" },
				root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
				filetypes = { "python" },
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							useLibraryCodeForTypes = true,
						},
					},
				},
				capabilities = capabilities,
				on_attach = on_attach,
			}

			-- Bash
			vim.lsp.config["bashls"] = {
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh", "bash", "zsh" },
				settings = {
					bashIde = {
						shellcheckPath = "shellcheck", -- wenn installiert
					},
				},
				capabilities = capabilities,
				on_attach = on_attach,
			}

			-- Enable the server
			vim.lsp.enable({ "basedpyright", "bashls" })
		end,
	},
}
