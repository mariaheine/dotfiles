return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			-- Don't auto-hijack `nvim .` — opening a directory leaves you on an empty buffer
			-- (or the snacks dashboard) instead of forcing the file tree open.
			hijack_directories = {
				enable = false,
			},
			view = {
				-- Pane width auto-fits the longest visible filename, clamped between min and max.
				adaptive_size = true,
				width = { min = 25, max = 60, padding = 1 },
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			filters = {
				dotfiles = true,
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = { ".git", "node_modules", "obj", "bin" },
			},
		})
		-- disable netrw at the very start of your init.lua (strongly advised)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Toggle file explorer
		keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

		-- Focus file explorer (move cursor to it)
		keymap("n", "<Leader>E", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })

		-- Find current file in tree
		keymap("n", "<Leader>fe", ":NvimTreeFindFile<CR>", { desc = "Find file in explorer" })
	end,
}
