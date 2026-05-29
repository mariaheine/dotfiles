return {
	-- Claude Code integration. Opens Claude in a terminal split, sends selections,
	-- and shows file edits as inline diffs you can accept/reject hunk-by-hunk.
	-- https://github.com/coder/claudecode.nvim
	--
	-- Requires the `claude` CLI on $PATH. Verify with `which claude` in your shell.
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" }, -- snacks integration gives nicer terminal/notify UI
		event = "VeryLazy",
		config = true,
		keys = {
			-- Group label only — actual chord is two-key (`<Leader>a*`)
			{ "<leader>a", nil, desc = "AI / Claude Code" },

			-- ─── Session control ───────────────────────────────────────────
			{ "<leader>ac", "<cmd>ClaudeCode<cr>",        desc = "Toggle Claude (open/close terminal split)" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>",   desc = "Focus Claude pane" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume previous Claude session" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue current Claude session" },

			-- ─── Sending context ───────────────────────────────────────────
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude context" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>",  mode = "v", desc = "Send visual selection to Claude" },
			-- When focused in nvim-tree, the same key adds the highlighted file to context
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file from explorer to Claude context",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
			},

			-- ─── Diff review ───────────────────────────────────────────────
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude's proposed diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Reject Claude's proposed diff" },
		},
	},
}
