return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup { manual = true }
    vim.keymap.set('i', '<A-f>', neocodeium.accept)
    vim.keymap.set('i', '<A-w>', neocodeium.accept_line)
    vim.keymap.set('i', '<A-c>', neocodeium.cycle_or_complete)
    vim.keymap.set('i', '<A-d>', neocodeium.clear)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'NeoCodeiumCompletionDisplayed',
      callback = function()
        require('cmp').abort()
      end,
    })
  end,
}
