local M = {
  'nvim-tree/nvim-tree.lua',
  event = 'VeryLazy',
}

function M.config()
  local nvimTreeFocusOrToggle = function()
    local nvimTree = require 'nvim-tree.api'
    local currentBuf = vim.api.nvim_get_current_buf()
    local currentBufFt = vim.api.nvim_get_option_value('filetype', { buf = currentBuf })
    if currentBufFt == 'NvimTree' then
      nvimTree.tree.toggle()
    else
      nvimTree.tree.focus()
    end
  end
  vim.keymap.set('n', '|', nvimTreeFocusOrToggle, { desc = 'Explorer' })

  -- local WIDTH_RATIO = 0.6
  -- local HEIGHT_RATIO = 0.6
  require('nvim-tree').setup {
    hijack_netrw = false,
    sync_root_with_cwd = true,
    view = {
      side = 'right',
      relativenumber = true,
      -- float = {
      --   enable = true,
      --   open_win_config = function()
      --     local screen_w = vim.opt.columns:get()
      --     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
      --     local window_w = screen_w * WIDTH_RATIO
      --     local window_h = screen_h * HEIGHT_RATIO
      --     local window_w_int = math.floor(window_w)
      --     local window_h_int = math.floor(window_h)
      --     local center_x = (screen_w - window_w) / 2
      --     local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
      --     return {
      --       border = 'rounded',
      --       relative = 'editor',
      --       row = center_y,
      --       col = center_x,
      --       width = window_w_int,
      --       height = window_h_int,
      --     }
      --   end,
      -- },
      -- width = function()
      --   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
      -- end,
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = 'none',
      root_folder_label = ':t',
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = '└',
          edge = '│',
          item = '│',
          none = ' ',
        },
      },
      special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
      symlink_destination = true,
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {},
    },

    diagnostics = {
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
    },
  }
end

return M
