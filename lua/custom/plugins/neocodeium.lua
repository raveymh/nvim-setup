return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup { manual = false }
    vim.keymap.set('i', '<A-f>', neocodeium.accept)
    vim.keymap.set('i', '<A-w>', neocodeium.accept_line)
    vim.keymap.set('i', '<A-c>', neocodeium.cycle_or_complete)
    vim.keymap.set('i', '<A-e>', neocodeium.clear)
    vim.keymap.set('n', '<A-i>', '<cmd>NeoCodeium toggle<CR>', { desc = 'Toggle NeoCodeium in current buffer', noremap = true })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'NeoCodeiumCompletionDisplayed',
      callback = function()
        require('cmp').abort()
      end,
    })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'NeoCodeiumServerConnected',
      callback = function()
        require('neocodeium.commands').disable()
      end,
    })
  end,
}
