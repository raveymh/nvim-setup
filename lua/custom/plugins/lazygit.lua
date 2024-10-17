return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<CR>', { desc = 'LazyGit TUI' }),
  -- order to load the plugin when the command is run for the first time
}
