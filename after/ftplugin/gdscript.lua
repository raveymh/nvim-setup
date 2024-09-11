-- local set = vim.opt_local
--
-- set.formatoptions:remove 'o'
vim.keymap.set({ 'n' }, '<leader>g', '<Esc>:!gdformat %<CR>', { desc = '[G]d format' })
