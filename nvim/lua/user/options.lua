vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.autoindent = true

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'h', 'cpp', 'hpp' },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

-- Makes the breakpoint \ error \ sign bar permenant, mainly due to consatant flickering
vim.opt.signcolumn = "yes"

-- Sidebar numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard with system
vim.opt.clipboard = "unnamedplus"

-- Folding configs
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99 


-- Timing
vim.opt.timeoutlen = 500

-- Wrapping
vim.opt.wrap = false

-- Formatting
vim.opt.textwidth = 120

-- Colorscheme
vim.cmd.colorscheme('zenbones')
-- vim.cmd("highlight Normal guibg=dark")
-- vim.cmd("highlight Normal ctermbg=Dark")

