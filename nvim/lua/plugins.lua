local vim = vim
local exectute = vim.api.nvim_command
local fn = vim.fn

vim.cmd('packadd packer.nvim')

local packer = require('packer')
local util = require('packer.util')

packer.startup(function()
	local use = use
	use {'neoclide/coc.nvim', branch = 'release'}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)
