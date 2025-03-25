-- Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal effort. They all share same configuration approaches and general design principles.
-- https://github.com/echasnovski/mini.nvim
return {
    {
	'echasnovski/mini.nvim',
    enabled = false,
	config = function()
	    local statusline = require 'mini.statusline'
	    statusline.setup { use_icons = true }
	end
    },
    {
	'echasnovski/mini.icons',
    enabled = false,
	config = function()
		local icons = require 'mini.icons'
		icons.setup { }
	end
    },
}
