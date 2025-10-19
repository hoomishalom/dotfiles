-- Remove ZZ from save and exit
vim.keymap.set('n', 'ZZ', '<NOP>', {noremap = true, silent = true})

-- Map NvimTreeToggle 
-- vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fe', ':lua MiniFiles.open()<CR>', {noremap = true, silent = true})

-- Map jk to leave Insert/Terminal mode  
vim.keymap.set('i', 'jk', '<Esc>', {noremap = true, silent = true, desc = "Leave insert mode" })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', {noremap = true, silent = true, desc = "Leave terminal mode" })

-- Map Esc to :noh (stop highlighting after search)
vim.keymap.set({'n', 'v'}, '<Esc>', ':noh<CR>', {noremap = true, silent = true})

-- Telescope keybinds
vim.keymap.set({'n', 'v'}, '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set({'n', 'v'}, '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope buffers' })
vim.keymap.set({'n', 'v'}, '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
vim.keymap.set({'n', 'v'}, '<leader>fk', require('telescope.builtin').keymaps, { desc = 'Telescope fuzzy find keybinds' })
