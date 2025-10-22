vim.lsp.enable("clangd")

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics' })
