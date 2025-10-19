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
    }
}
