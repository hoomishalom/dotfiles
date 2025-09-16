-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable default space behavior in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

require("config.lazy")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = false 
vim.opt.autoindent = true

-- Sidebar numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard with system
vim.opt.clipboard = "unnamedplus"


-- Remove autocomment on enter
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- KEYBINDS --

-- Remove ZZ from save and exit
vim.keymap.set('n', 'ZZ', '<NOP>', {noremap = true, silent = true})

-- Map NvimTreeToggle 
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Map jk to leave Insert mode  
vim.keymap.set('i', 'jk', '<Esc>', {noremap = true, silent = true})

-- Map Esc to :noh (stop highlighting after search)
vim.keymap.set({'n', 'v'}, '<Esc>', ':noh<CR>', {noremap = true, silent = true})

-- Telescope keybinds
vim.keymap.set({'n', 'v'}, '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set({'n', 'v'}, '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope buffers' })
vim.keymap.set({'n', 'v'}, '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })

-- Statusline --
function _G.GetCharHex()
  local line_content = vim.fn.getline('.')
  local cursor_col = vim.fn.col('.')

  -- Use string.sub() to get the character under the cursor
  local char = string.sub(line_content, cursor_col, cursor_col)

  if not char or char == '' then return '' end

  local byte = string.byte(char)
  return string.format(" [0x%02X] ", byte)
end

-- Define Statusline
vim.opt.statusline = table.concat({
  '%f ',      -- File name
  '%y ',      -- File type
  '%=',       -- Right align following items
  '%{v:lua.GetCharHex()}', -- Call the global Lua function
  '%l:%c ',   -- Line and column number
})

-- Filetypes
vim.filetype.add({
  extension = {
    fasm = "fasm",
  }
})
