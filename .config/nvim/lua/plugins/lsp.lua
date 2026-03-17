return {
  {
    "williamboman/mason.nvim",
    opts = {},
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
        "basedpyright",
        "bashls"
      },
      automatic_installation = true,
    },
  },
  -- clear, consistent iconography layer to Neovim’s completion UI (LSP, snippets, paths, etc.)
  -- https://github.com/onsails/lspkind.nvim
  {
    "onsails/lspkind.nvim",
  },
  -- completion engine plugin for neovim
  -- https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      -- LSP completion source (connects to basedpyright)
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
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          -- Scroll documentation
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          -- Complete
          ['<C-Space>'] = cmp.mapping.complete(),
          -- Close completion window
          ['<C-e>'] = cmp.mapping.abort(),
          -- confirm selection
          -- "Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items."
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- Tab to navigate snippets
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },      -- LSP (basedpyright)
          { name = 'path' },           -- File paths
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },         -- Words from current buffer
        }),

        -- Optional: Add icons for completion kinds
        formatting = {
          format = function(entry, vim_item)
            -- Add kind icons
            vim_item.kind = string.format('%s %s', 
              require('lspkind').symbolic(vim_item.kind), 
              vim_item.kind)
            return vim_item
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",  
    },
    config = function()

      -- see ":help lsp" for lots of interesting information

      local vim = vim
      local capabilities = require("cmp_nvim_lsp").default_capabilities()


      -- adding keymaps when attaching
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      end
      
      -- Define server configurations
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
        -- Enable inlay hints
        capabilities = capabilities, 
        on_attach = on_attach
      }

      vim.lsp.config["bashls"] = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          bashIde = {
            shellcheckPath = "shellcheck", -- wenn installiert
          }
        }
      }
      
      -- Enable the server
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("bashls")
    end,
  },
}
