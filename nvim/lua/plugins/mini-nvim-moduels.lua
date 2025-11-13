return  {
    {
        'nvim-mini/mini.icons',
        version = false,
    },
    {
        'nvim-mini/mini.files',
        version = false,
        config = function ()
            require("mini.files").setup()
        end
    },
    {
        'nvim-mini/mini.splitjoin',
        version = '*',
        opts = {
            mappings = {
                toggle = 'gS',
                split = '',
                join = '',
            },

            -- Detection options: where split/join should be done
            detect = {
                -- Array of Lua patterns to detect region with arguments.
                -- Default: { '%b()', '%b[]', '%b{}' }
                brackets = nil,

                -- String Lua pattern defining argument separator
                separator = ',',

                -- Array of Lua patterns for sub-regions to exclude separators from.
                -- Enables correct detection in presence of nested brackets and quotes.
                -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
                exclude_regions = nil,
            },

            -- Split options
            split = {
                hooks_pre = {},
                hooks_post = {},
            },

            -- Join options
            join = {
                hooks_pre = {},
                hooks_post = {},
            }
        }
    }
}

