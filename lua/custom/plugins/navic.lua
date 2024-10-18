local M = {
  'SmiteshP/nvim-navic',
}

function M.config()
  require('nvim-navic').setup {
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
    depth_limit = 0,
  }
end

return M
