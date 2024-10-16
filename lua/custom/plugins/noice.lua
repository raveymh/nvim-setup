return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      'rcarriga/nvim-notify',
      name = 'notify',
      opts = {
        stages = 'static',
        background_colour = '#000000',
      },
    },
  },
  vim.keymap.set('n', '<leader>n', '<cmd>Noice<CR>', { desc = 'Noice messages' }),
  init = function()
    vim.opt.lazyredraw = false
  end,
  require('noice').setup {
    lsp = {
      progress = {
        enabled = false,
        view = 'notify',
      },
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
        ['vim.lsp.util.stylize_markdown'] = false,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = false,
        },
        view = 'notify',
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
    },
    messages = {
      view = 'mini',
    },
    views = {
      mini = {
        timeout = 1000,
        border = {
          style = 'none',
          padding = { 0, 1 },
        },
        win_options = {
          winblend = 0,
        },
      },
    },
    routes = {
      {
        view = 'split',
        filter = { event = 'msg_show', min_height = 20 },
      },
    },
  },
}
