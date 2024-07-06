-- vim.filetype.add { extension = { wgsl = "wgsl" } }
--
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.wgsl = {
--     install_info = {
--         url = "https://github.com/szebniok/tree-sitter-wgsl",
--         files = {"src/parser.c"}
--     },
-- }

local fn = vim.fn
vim.opt.termguicolors = true
-- vim.g.loaded = 1

-- vim.g.loaded_netrwPlugin = 1

-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install your plugins here
require("lazy").setup({
	import = "user.plugins",
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
})

-- require "user.plugins"
require("user.config")
require("user.keymaps")
require("user.options")
require("user.colorscheme")

-- test
