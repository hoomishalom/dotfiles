return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-web-devicons").setup()
    local nvimtree = require("nvim-tree")
    
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    nvimtree.setup({
      -- Enable git status in the tree
      git = {
        enable = true,
        ignore = false,
      },

      -- Show icons in the file tree
      renderer = {
        highlight_opened_files = "all",  -- Highlight opened files
        icons = {
          glyphs = {
            default = "",  -- Icon for files
            folder = {
              default = "",  -- Icon for folders
              open = "",     -- Icon for opened folders
            },
          },
        },
      },

      -- Auto-close the tree when it's the only open buffer
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })


    -- Auto-open tree on directory startup
    local function open_nvim_tree_on_startup(data)
      local directory = vim.fn.isdirectory(data.file) == 1
      if not directory then return end
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = open_nvim_tree_on_startup,
    })
  end
}


