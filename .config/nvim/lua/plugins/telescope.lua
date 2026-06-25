return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			-- snippet picker (fuzzy-search + preview LuaSnip snippets)
			"benfowler/telescope-luasnip.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					-- ignore noise
					file_ignore_patterns = { "node_modules", ".git/" },
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						-- This is the key part: find hidden files and respect .gitignore
						hidden = true,
						find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			-- Load the fzf extension
			telescope.load_extension("fzf")
			-- Load the LuaSnip snippet picker extension
			telescope.load_extension("luasnip")
			-- telescope.load_extension("notify")

			-- THEN add your keymaps (after telescope is loaded)
			-- pickers like find_files: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<Leader>h", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<Leader>fs", function()
				telescope.extensions.luasnip.luasnip()
			end, { desc = "Find snippets" })
			-- Theme picker — live-previews each colorscheme as you scroll, commits on <CR>.
			-- Session-only: doesn't rewrite the saved default, so a restart returns to whatever
			-- was last persisted with <leader>cT below.
			vim.keymap.set("n", "<Leader>ct", function()
				builtin.colorscheme({ enable_preview = true })
			end, { desc = "Pick colorscheme/theme" })
			-- Persist the CURRENT colorscheme as the startup default. init.lua reads this file on
			-- launch, so the next time nvim opens it'll start in the theme that's active right now.
			vim.keymap.set("n", "<Leader>cT", function()
				local theme = vim.g.colors_name
				if not theme or theme == "" then
					vim.notify("No active colorscheme to save", vim.log.levels.WARN)
					return
				end
				vim.fn.writefile({ theme }, vim.fn.stdpath("data") .. "/theme.txt")
				vim.notify("Default theme set to '" .. theme .. "'", vim.log.levels.INFO)
			end, { desc = "Set current theme as default" })
			-- vim.keymap.set(
			-- 	"n",
			-- 	"<Leader>nn",
			-- 	require("telescope").extensions.notify.notify(),
			-- 	{ desc = "Notification History" }
			-- )
			-- you can use below pickers after
			-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
		end,
	},
}
