local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.scrolloff = 5
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undofile = true
o.incsearch = true
o.hidden = true
bo.autoindent = true
bo.smartindent = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.relativenumber = true
wo.wrap = false

require('plugins')
require('nvim-treesitter.configs').setup {
	ensure_installed = { "c" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true
	}
}
require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}

require('telescope').load_extension('fzf')

local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(
		mode,
		key,
		result,
		{noremap = true, silent = true}
	)
end

key_mapper('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<cr>')
key_mapper('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<cr>')
