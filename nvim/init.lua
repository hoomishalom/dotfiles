-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable default space behavior in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

require("config.lazy")

require("user/neovide")
require("user/options")
require("user/keymaps")
require("user/statusline")
require("user/lsp")

-- Remove autocomment on enter
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})


-- Filetypes
vim.filetype.add({
  extension = {
    fasm = "fasm",
  }
})


