return {
  {
    'numToStr/Comment.nvim',
    opts = {
    },
    init = function()
      -- Example: Add to your statusline
      vim.o.statusline = "%{ObsessionStatus()} " .. vim.o.statusline
    end,
  }
}
