return {
  'stevearc/aerial.nvim',
  opts = {
    nav = {
      win_opts = {
        winblend = 0,
      },
      autojump = true,
      preview = true,
      keymaps = {
        ['q'] = 'actions.close',
        ['<esc>'] = 'actions.close',
      },
    },
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { desc = 'Next symbol' }),
  vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { desc = 'Previous symbol' }),
  vim.keymap.set('n', '<leader>a', '<cmd>AerialNavToggle<CR>', { desc = 'Toggle symbol navigation' }),
}
