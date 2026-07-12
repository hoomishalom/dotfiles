local ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "cpp", "javascript", "html", "java", "rust", "markdown", "markdown_inline" }

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",

    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        local installed = require('nvim-treesitter.config').get_installed()
        local to_install = vim.iter(ensure_installed):filter(
            function(parser)
                return not vim.tbl_contains(installed, parser)
            end
        ):totable()

        require('nvim-treesitter').install(to_install)
    end
}
