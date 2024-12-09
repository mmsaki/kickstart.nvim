-- initial file
vim.opt.wildignore = { '*.o', '*.a', '__pycache__', '*.pyc', 'node_modules' }
vim.opt.scrolloff = 15
vim.opt.shiftwidth = 4
vim.cmd 'colorscheme habamax'

-- copy paste from clipboard outside of vim
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

require 'user.reload'
vim.api.nvim_set_keymap('n', '<leader><CR>', '<cmd>lua ReloadConfig()<CR>', { noremap = true, silent = false })

require 'config.lazy'
-- require('lspconfig').solidity_ls_nomicfoundation.setup {}
-- require'lspconfig'.pyright.setup{}

vim.keymap.set('v', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('v', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('v', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('v', '<down>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('i', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('i', '<left>', '<cmd>echo "Use j to move!!"<CR>')

-- save files with enter
vim.keymap.set('n', '<leader><CR>', '<cmd>:w<CR>')
-- map the explore commands from control to command
vim.keymap.set('n', '<D-o>', '<C-o>')
vim.keymap.set('n', '<D-i>', '<C-i>')
-- map commands from control
vim.keymap.set('i', '<D-[>', '<C-[>')
vim.keymap.set('i', '<D-]>', '<C-]>')
