-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("options")

require("keymap")

require("autocmd")

require("lazy_setup")

require("urlhighlight")

vim.cmd.colorscheme("astrodark")

-- vim: ts=2 sts=2 sw=2 et
