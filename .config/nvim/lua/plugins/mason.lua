return {
	-- Package manager for nvim lsp, linters, formatters and DAP servers
	-- https://github.com/mason-org/mason.nvim
	-- 🐖 Menu with: Mason
	-- 🐖 Updates with :MasonUpdate
	{
		"williamboman/mason.nvim",
		opts = {
			registries = {
				-- Additional registries required by roslyn.nvim
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		},
	},
	--
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- 🐖 ADD NEW LSP SERVERS HERE
				-- And write them configs in 'lsp.lua'
				"basedpyright", -- python lsp
				"bashls", -- bash lsp
			},
			automatic_installation = true,
		},
	},
	-- Autoinstaller for tools
	-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- 🐖 Below handles the automatic installation of formatters required by 'conform.lua'
				"shfmt",
				"stylua",
				"csharpier",
				"black",
				-- c# roslyn
				"roslyn",
			},
		},
	},
}
