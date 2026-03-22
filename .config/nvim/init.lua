local config_dir = vim.fn.expand("~/.config/nvim/lua")

package.path = config_dir .. "/?.lua;" .. package.path

vim.opt.runtimepath:prepend(vim.fn.stdpath("config"))

vim.o.runtimepath = vim.fn.stdpath('config') .. '/vim,' .. vim.o.runtimepath

vim.o.packpath = vim.o.runtimepath

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true

vim.cmd('source ' .. vim.fn.expand('~') .. '/.vimrc')

vim.o.cmdheight = 3

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

print(vim.fn.stdpath("config") .. "/lua/plugins.lua")
