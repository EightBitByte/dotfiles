vim.o.number = true
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.showmode = false
vim.cmd("colorscheme habamax")

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
