return {
	-- clear, consistent iconography layer to Neovim’s completion UI (LSP, snippets, paths, etc.)
	-- https://github.com/onsails/lspkind.nvim
	{
		"onsails/lspkind.nvim",
	},
	-- completion engine plugin for neovim
	-- https://github.com/hrsh7th/nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		-- Sources for possible completions are listed here
		dependencies = {
			-- LSP completion source (connects to basedpyright and other formatters)
			"hrsh7th/cmp-nvim-lsp",
			-- Source for file system paths
			-- super neat, will complete written system paths
			"hrsh7th/cmp-path",
			-- Source for buffer words
			"hrsh7th/cmp-buffer",
			-- Snippet engine (required for LSP snippets)
			-- see nvim-cmp docs on snippets handling
			"L3MON4D3/LuaSnip",
			-- Snippets collection for a set of different programming languages.
			-- https://github.com/rafamadriz/friendly-snippets
			"rafamadriz/friendly-snippets",
		},

		config = function()
			local cmp = require("cmp")

			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					-- Navigate between completion items
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					-- Scroll documentation
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					-- Complete
					["<C-Space>"] = cmp.mapping.complete(),
					-- Close completion window
					["<C-e>"] = cmp.mapping.abort(),
					-- confirm selection
					-- "Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items."
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- Tab to navigate snippets
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP
					{ name = "path" }, -- File paths
					{ name = "luasnip" },
				}, {
					{ name = "buffer" }, -- Words from current buffer
				}),

				-- Optional: Add icons for completion kinds
				formatting = {
					format = function(entry, vim_item)
						-- Add kind icons
						vim_item.kind =
							string.format("%s %s", require("lspkind").symbolic(vim_item.kind), vim_item.kind)
						return vim_item
					end,
				},
			})
		end,
	},
}
