local vim = vim

-- Peoples dotfiles:
-- https://github.com/dbittencourt/dotfiles/blob/master/nvim/.config/

-- __
--/\ \
--\ \ \         __     ____    __  __
-- \ \ \  __  /'__`\  /\_ ,`\ /\ \/\ \
--  \ \ \L\ \/\ \L\.\_\/_/  /_\ \ \_\ \
--   \ \____/\ \__/.\_\ /\____\\/`____ \
--    \/___/  \/__/\/_/ \/____/ `/___/> \
--                                 /\___/
--                                 \/__/
-- this means it loads a config located at ./config/lazy.lua
-- that config on the other hand loads plugins from ./plugins/asd.lua etc.
-- theme is a package, it is being set in ./config/lazy.lua
require("config.lazy")

-- ________  ________  ________  ___  ________  ________
--|\   __  \|\   __  \|\   ____\|\  \|\   ____\|\   ____\
--\ \  \|\ /\ \  \|\  \ \  \___|\ \  \ \  \___|\ \  \___|_
-- \ \   __  \ \   __  \ \_____  \ \  \ \  \    \ \_____  \
--  \ \  \|\  \ \  \ \  \|____|\  \ \  \ \  \____\|____|\  \
--   \ \_______\ \__\ \__\____\_\  \ \__\ \_______\____\_\  \
--    \|_______|\|__|\|__|\_________\|__|\|_______|\_________\
--                       \|_________|             \|_________|
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.clipboard = unnamedplus

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Make n/N always go down/up regardless of search direction (/ or ?)
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next match (always down)" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev match (always up)" })

-- Pretty diagnostics: rounded float, source name, severity-sorted, neat virtual-text prefix.
-- Noice doesn't touch diagnostic popups — this is the canonical place to style them.
vim.diagnostic.config({
	float = {
		border = "rounded",
		source = true,    -- show which LSP produced the diagnostic (e.g. "roslyn")
		header = "",
		prefix = "",
	},
	virtual_text = {
		-- Per-severity prefix glyphs.
		prefix = function(diagnostic)
			local sev = vim.diagnostic.severity
			if diagnostic.severity == sev.ERROR then
				return "👻"
			elseif diagnostic.severity == sev.WARN then
				return "🐙"
			elseif diagnostic.severity == sev.INFO then
				return "🐇"
			elseif diagnostic.severity == sev.HINT then
				return "🐖"
			else
				return "●"
			end
		end,
		spacing = 2,
	},
	severity_sort = true, -- errors above warnings above info
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- Auto-clear search highlights once the cursor leaves a match.
-- While you're sitting on a hit (or stepping through with n/N), highlights stay visible for context.
-- The moment you move the cursor off all matches (hjkl, w, gg, etc.), :nohlsearch fires.
-- v:hlsearch == 1 means hlsearch is currently active; searchcount().exact_match == 0 means cursor isn't on a match.
vim.api.nvim_create_autocmd("CursorMoved", {
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount({ maxcount = 0 }).exact_match == 0 then
			vim.cmd.nohlsearch()
		end
	end,
})

-- Horizontal scroll with Alt+ScrollWheel (requires wrap=false)
vim.keymap.set({ "n", "i", "v" }, "<M-ScrollWheelUp>", "5zh", { desc = "Scroll left" })
vim.keymap.set({ "n", "i", "v" }, "<M-ScrollWheelDown>", "5zl", { desc = "Scroll right" })
-- jump list navigation
vim.keymap.set("n", "gre", "<C-o>", { desc = "Go back" })
vim.keymap.set("n", "grf", "<C-i>", { desc = "Go forward" })

-- split window behaviour
vim.o.splitright = true
vim.o.splitbelow = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- set a ruler at column 100
vim.opt.colorcolumn = "100"

-- disable line wrapping
vim.o.wrap = false

-- ________   ________  ___      ___
--|\   ___  \|\   __  \|\  \    /  /|
--\ \  \\ \  \ \  \|\  \ \  \  /  / /
-- \ \  \\ \  \ \   __  \ \  \/  / /
--  \ \  \\ \  \ \  \ \  \ \    / /
--   \ \__\\ \__\ \__\ \__\ \__/ /
--    \|__| \|__|\|__|\|__|\|__|/
--
-- Splits navigation
vim.keymap.set("n", "<C-q>", "<C-w>q", { desc = "Close pane" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Tab navigation
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabprev<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tf", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })

-- _________  _______   ________  _____ ______   ___  ________   ________  ___
--|\___   ___\\  ___ \ |\   __  \|\   _ \  _   \|\  \|\   ___  \|\   __  \|\  \
--\|___ \  \_\ \   __/|\ \  \|\  \ \  \\\__\ \  \ \  \ \  \\ \  \ \  \|\  \ \  \
--     \ \  \ \ \  \_|/_\ \   _  _\ \  \\|__| \  \ \  \ \  \\ \  \ \   __  \ \  \
--      \ \  \ \ \  \_|\ \ \  \\  \\ \  \    \ \  \ \  \ \  \\ \  \ \  \ \  \ \  \____
--       \ \__\ \ \_______\ \__\\ _\\ \__\    \ \__\ \__\ \__\\ \__\ \__\ \__\ \_______\
--        \|__|  \|_______|\|__|\|__|\|__|     \|__|\|__|\|__| \|__|\|__|\|__|\|_______|
--
-- Track our terminal window
local terminal_win = nil

-- Toggle function
local function toggle_terminal()
	if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
		-- Terminal is open → CLOSE it
		vim.api.nvim_win_close(terminal_win, true)
		terminal_win = nil
	else
		-- Terminal is closed → OPEN it
		vim.cmd("below 15split term://bash")
		terminal_win = vim.api.nvim_get_current_win()
		vim.cmd("startinsert") -- Go into insert mode automatically
	end
end

-- Map Ctrl+` to toggle (works from both normal and terminal mode)
vim.keymap.set({ "n", "t" }, "<leader>`", toggle_terminal, { desc = "Toggle terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- LSP convenience commands. `:LspInfo` / `:LspLog` were removed in Neovim 0.11+; re-add as user commands.
vim.api.nvim_create_user_command("LspLog", function()
	vim.cmd.edit(vim.lsp.get_log_path())
end, { desc = "Open the LSP log" })

vim.api.nvim_create_user_command("LspInfo", function()
	vim.cmd("checkhealth vim.lsp")
end, { desc = "Show LSP health/status" })

-- ________  ___  ___  _______   _____ ______   _______
--|\   __  \|\  \|\  \|\  ___ \ |\   _ \  _   \|\  ___ \
--\ \  \|\  \ \  \\\  \ \   __/|\ \  \\\__\ \  \ \   __/|
-- \ \   __  \ \   __  \ \  \_|/_\ \  \\|__| \  \ \  \_|/__
--  \ \  \ \  \ \  \ \  \ \  \_|\ \ \  \    \ \  \ \  \_|\ \
--   \ \__\ \__\ \__\ \__\ \_______\ \__\    \ \__\ \_______\
--    \|__|\|__|\|__|\|__|\|_______|\|__|     \|__|\|_______|
--
-- The active startup theme. All plugins have finished loading by now (eager plugins like everforest
-- and catppuccin both load via `lazy = false, priority = 1000`).
-- Available choices:
--   everforest-hard | everforest-medium | everforest-soft  (everforest variants)
--   catppuccin | catppuccin-mocha | catppuccin-frappe | catppuccin-macchiato | catppuccin-latte
-- vim.cmd.colorscheme("catppuccin-frappe")
vim.cmd.colorscheme("everforest-hard")
