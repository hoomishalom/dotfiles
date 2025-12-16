-- Remove ZZ from save and exit
vim.keymap.set('n', 'ZZ', '<NOP>', {noremap = true, silent = true})

-- vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fe', ':lua MiniFiles.open()<CR>', {noremap = true, silent = true})

-- Map lk to leave Insert/Terminal mode  
vim.keymap.set({'v', 'i'}, 'lk', '<Esc>', {noremap = true, silent = true, desc = "Leave insert mode" })
vim.keymap.set('t', 'lk', '<C-\\><C-n>', {noremap = true, silent = true, desc = "Leave terminal mode" })

-- Map Esc to :noh (stop highlighting after search)
vim.keymap.set({'n', 'v'}, '<Esc>', ':noh<CR>', {noremap = true, silent = true})

-- Map Y to copying a line without newline
vim.keymap.set({'n', 'v'}, 'Y', '^y$', {noremap = true, silent = true, desc = "Copy a line without the newline"})

-- Telescope keybinds
vim.keymap.set({'n', 'v'}, '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set({'n', 'v'}, '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope buffers' })
vim.keymap.set({'n', 'v'}, '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
vim.keymap.set({'n', 'v'}, '<leader>fk', require('telescope.builtin').keymaps, { desc = 'Telescope fuzzy find keybinds' })

-- Lsp keybinds

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics' })
vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true, desc = 'Show loclist' })
vim.keymap.set('n', '<leader>Q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN }) end, { silent = true, desc = 'Show loclist' })
vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, { silent = true, desc = 'Goto declaration' })
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { silent = true, desc = 'Goto definition' })
vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = "rounded" }) end, { silent = true, desc = 'Show docs' })
vim.keymap.set('n', '<c-s>', function() vim.lsp.buf.signature_help({ border = "rounded" }) end, { silent = true, desc = 'Show signature help' })
vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition({ border = "rounded" }) end, { silent = true, desc = 'Show type definition' })
vim.keymap.set('n', 'gra', function() vim.lsp.buf.code_action({ border = "rounded" }) end, { silent = true, desc = 'Code actions' })
-- vim.keymap.set('n', '<leader>bf', function() vim.lsp.buf.format({ async = true }) end, { silent = true, desc = 'Format buffer' })
