local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function filename_no_ext()
	return vim.fn.expand("%:t:r")
end

ls.add_snippets("cs", {
	s("grzeka", {
		t({
			"using Godot;",
			"using System;",
			"using System.Reactive.Linq;",
			"using Rzeka;",
			"",
			"namespace ",
		}),
		i(1, "SnippetNamespace"),
		t({ ";", "public partial class " }),
		f(filename_no_ext, {}),
		t({ " : " }),
		i(2, "Node"),
		t({
			"",
			"{",
			"\tCollectibleDisposable Q { get; set; }",
			"\tIRzeka rzeka => LittleSource.Rzeka;",
			"",
			"\tpublic override void _EnterTree()",
			"\t{",
			"\t\tQ = new();",
			"\t}",
			"",
			"\tpublic override void _Ready()",
			"\t{",
			"\t\t",
		}),
		i(0),
		t({
			"",
			"\t}",
			"",
			"\tpublic override void _Process(double delta)",
			"\t{",
			"\t}",
			"",
			"\tpublic override void _ExitTree()",
			"\t{",
			"\t\tQ.Dispose();",
			"\t}",
			"}",
		}),
	}),
})
