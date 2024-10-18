return {
  'ThePrimeagen/harpoon',
  event = 'VimEnter',
  enabled = true,
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():add()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local shortened = buf_name:gsub('(.*\\)(.*\\.*\\.*)', '...\\%2')
      vim.notify(shortened, vim.log.levels.INFO, {
        title = '♆ Harpooned',
      })
    end, { desc = 'Add buffer to harpoon', noremap = true })

    vim.keymap.set('n', '<leader>e', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle harpoon menu', noremap = true })

    vim.keymap.set('n', '<a-1>', function()
      harpoon:list():select(1)
    end, { noremap = true })
    vim.keymap.set('n', '<a-2>', function()
      harpoon:list():select(2)
    end, { noremap = true })
    vim.keymap.set('n', '<a-3>', function()
      harpoon:list():select(3)
    end, { noremap = true })
    vim.keymap.set('n', '<a-4>', function()
      harpoon:list():select(4)
    end, { noremap = true })
    vim.keymap.set('n', '<a-5>', function()
      harpoon:list():select(5)
    end, { noremap = true })
  end,
}
