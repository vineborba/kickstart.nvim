return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    enabled = false,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
      show_end_of_buffer = true,
    },
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
