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
