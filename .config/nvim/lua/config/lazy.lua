

print("Starting lazy.nvim bootstrap...")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print("Lazy path: " .. lazypath)

-- Bootstrap lazy.nvim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- map leader set to the win key
-- this way you can use it as <D> in your vim.keymap.set configurations
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- Fallback colorschemes shown during lazy's first-install screen. The actual startup theme
  -- is set at the end of init.lua so it's easy to see and change in one place.
  install = { colorscheme = { "everforest", "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- 🐖 default theme needs to be set here don't ask me
-- vim.cmd.colorscheme "everforest-soft"
