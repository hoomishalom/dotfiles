vim.g.neovide_fullscreen = false
vim.g.neovide_no_idle = false
vim.g.neovide_scroll_animation_length = 0.2

vim.g.gui_font_default_size = 14
vim.g.gui_font_size = vim.g.gui_font_default_size
-- vim.g.gui_font_face = 'IosevkaCustomNerdFontComplete Nerd Font'
vim.g.gui_font_face = 'Hack Nerd Font'
vim.g.gui_antialiasing = 'subpixelantialias'
vim.g.gui_hinting = 'full'

RefreshGuiFont = function()
    vim.opt.guifont = string.format(
        '%s:h%s:#e-%s:#h-%s',
        vim.g.gui_font_face,
        vim.g.gui_font_size,
        vim.g.gui_antialiasing,
        vim.g.gui_hinting
    )
end

ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
end

ResetGuiFont = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
end

-- Start with default font size
ResetGuiFont()

vim.keymap.set({ 'n', 'i', 'v' }, '<C-=>', function() ResizeGuiFont(1) end, { silent = true, desc = 'Decrease GUI font size' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-->', function() ResizeGuiFont(-1) end, { silent = true, desc = 'Increase GUI font size' })
