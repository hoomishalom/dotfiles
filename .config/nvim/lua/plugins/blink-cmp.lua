return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',

    opts = {
        sources = {
            default = { 'lsp', 'snippets', 'buffer', 'path' }
        },
        keymap = { preset = 'default' },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant  = 'mono'
        },

        signature = { enabled = true }
    },
}
