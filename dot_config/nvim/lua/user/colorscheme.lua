local colorscheme = "ayu-dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
--asdaslkdjl

--Disables tildes after EOF
vim.cmd [[hi NonText guifg=bg]]
