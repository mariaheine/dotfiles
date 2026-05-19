-- Sailor Moon soft pastel palette
-- Moon Pink (Usagi/Sailor Moon)
-- Mercury Blue (Ami)
-- Mars Red-Rose (Rei)
-- Jupiter Green (Makoto)
-- Venus Gold-Peach (Minako)
-- Saturn Lavender (Hotaru)

local moon_pink    = "#FFB7C5"
local mercury_blue = "#A8D8EA"
local mars_rose    = "#FF9EAE"
local jupiter_mint = "#B5EAD7"
local venus_peach  = "#FFDAC1"
local saturn_lilac = "#C8A2C8"
local luna_gold    = "#FFE4A0"
local stardust     = "#E8D5F5"
local moonlight    = "#FFF0F5"
local cosmos_bg    = "#2D1B33"

return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown", "md" },
  opts = {
    enabled = true,
    html  = { enabled = false },
    latex = { enabled = false },

    heading = {
      -- Use a sign column icon per heading level
      sign = true,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      -- Background highlight per level
      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2",
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      },
    },

    bullet = {
      -- Nested bullet icons
      icons = { "✦", "✧", "◈", "◇" },
    },

    checkbox = {
      unchecked = { icon = "󰄱 " },
      checked   = { icon = "󰱒 " },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
      },
    },

    code = {
      style = "full",
      border = "thin",
      -- Show the language name as a label in the top-right of the block
      language_name = true,
      -- Padding inside the block so code doesn't hug the border
      left_pad  = 2,
      right_pad = 2,
      -- Use our custom highlight for the language badge
      highlight          = "RenderMarkdownCode",
      highlight_language = "RenderMarkdownCodeLanguage",
      highlight_inline   = "RenderMarkdownCodeInline",
    },

    dash = {
      -- Horizontal rule character
      icon = "─",
    },

    quote = {
      icon = "▎",
    },

    link = {
      image      = "󰥶 ",
      hyperlink  = "󰌹 ",
      highlight  = "RenderMarkdownLink",
    },
  },

  config = function(_, opts)
    -- Ensure treesitter highlighter is active on markdown buffers
    -- (required for syntax highlighting inside fenced code blocks)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(ev)
        vim.treesitter.start(ev.buf, "markdown")
        vim.wo.wrap = true
        vim.wo.linebreak = true
      end,
    })

    require("render-markdown").setup(opts)

    -- ── Sailor Moon highlight overrides ────────────────────────────────

    -- Headings (foreground)
    vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = moon_pink,    bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = mercury_blue, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = jupiter_mint, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = saturn_lilac, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = venus_peach,  bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = luna_gold,    bold = true })

    -- Headings (background — very faint tint)
    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = moon_pink,    bg = "#3D2030", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = mercury_blue, bg = "#1E2D3D", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = jupiter_mint, bg = "#1E3028", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = saturn_lilac, bg = "#2D2040", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = venus_peach,  bg = "#3D2A1E", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = luna_gold,    bg = "#3D3020", bold = true })

    -- Bullets
    vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = moon_pink })

    -- Code blocks
    vim.api.nvim_set_hl(0, "RenderMarkdownCode",         { bg = "#261530" })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline",   { fg = mars_rose,    bg = "#2D1B2E" })
    -- Language badge (e.g. "lua", "python") shown at the top of the block
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeLanguage", { fg = luna_gold, bg = "#261530", bold = true, italic = true })

    -- Table
    vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = moon_pink,    bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownTableRow",  { fg = stardust })
    vim.api.nvim_set_hl(0, "RenderMarkdownTableFill", { fg = saturn_lilac })

    -- Checkboxes
    vim.api.nvim_set_hl(0, "RenderMarkdownChecked",   { fg = jupiter_mint })
    vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = saturn_lilac })
    vim.api.nvim_set_hl(0, "RenderMarkdownTodo",      { fg = venus_peach  })

    -- Quote / callout
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = saturn_lilac, italic = true })

    -- Links
    vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = mercury_blue, underline = true })

    -- Horizontal rule
    vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = moon_pink })

    -- Sign column icons
    vim.api.nvim_set_hl(0, "RenderMarkdownSign", { fg = moon_pink })
  end,
}
