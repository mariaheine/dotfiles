return {
	"khoido2003/roslyn-filewatch.nvim",
	ft = "cs", -- Only load for C# files
	build = "nvim -l build.lua --", -- Compiles or downloads the Native Rust module fallback
	config = function()
		require("roslyn_filewatch").setup({
			-- === Core Settings ===
			-- List of LSP client names to hook into (required)
			client_names = { "roslyn_ls", "roslyn", "roslyn_lsp" },

			-- Project preset: "auto", "unity", "console", "large", "none"
			-- "auto" detects Unity/Godot/Large projects and applies optimized settings
			preset = "auto",

			-- Logging level: vim.log.levels.WARN, INFO, DEBUG, TRACE
			log_level = vim.log.levels.DEBUG,

			-- === Performance & Loading ===
			-- Defer project loading until first C# file is opened
			deferred_loading = true,
			deferred_loading_delay_ms = 500,

			-- Diagnostic throttling reduces UI lag during heavy file changes
			diagnostic_throttling = {
				enabled = true,
				debounce_ms = 500, -- Wait 500ms before requesting diagnostics
				visible_only = true, -- Only request diagnostics for visible buffers
			},

			-- === File Watching Configuration ===
			-- Directories to completely ignore (exact case-insensitive match)
			ignore_dirs = {
				"Library",
				"Temp",
				"Obj",
				"Bin",
				".git",
				".idea",
				".vs",
				".godot",
				".mono",
				"node_modules",
			},

			-- Glob patterns to exclude (follows gitignore syntax)
			-- Example: { "*.generated.cs", "**/foo/**" }
			ignore_patterns = {},

			-- List of extensions to watch
			watch_extensions = {
				".cs",
				".csproj",
				".sln",
				".slnx",
				".slnf",
				".props",
				".targets",
				".razor",
				".cshtml",
				".xaml",
			},

			-- Parse .sln/.slnx/.slnf to limit watch scope to project folders
			-- Highly recommended for performance on monorepos
			solution_aware = true,

			-- Respect standard .gitignore files
			respect_gitignore = true,

			-- === Event Processing ===
			-- Batch multiple events into single notifications
			batching = {
				enabled = true,
				interval = 300, -- Window to coalesce events (ms)
			},

			-- Max events to process per chunk (prevent UI freeze)
			-- Default: 1000 (Unity), 100 (others)
			max_events_per_batch = 1000,

			-- Debounce time for processing file system events
			processing_debounce_ms = 150,

			-- Quiet period (seconds) required after activity before triggering full scans
			-- Helps prevents freezing during massive changes (e.g. Unity re-import)
			activity_quiet_period = 5,

			-- Rename detection window (ms) to merge delete+create into rename
			rename_detection_ms = 200,

			-- === Advanced / Fallback ===
			-- Polling interval (ms) for fallback watcher and resilience checks
			poll_interval = 5000,

			-- Force non-native polling mode (not recommended unless fs_event fails)
			force_polling = false,

			-- Enable auto-restore of NuGet packages on .csproj change
			enable_autorestore = true,
		})
	end,
}
