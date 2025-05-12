-- [[ options.lua ]]
local opt = vim.opt

-- [[ CONTEXT ]]
opt.colorcolumn = '88'		-- Show col for max line length
opt.number = true           -- Show line number for current line
opt.relativenumber = true	-- Show relative line numbers
opt.scrolloff = 8		    -- Min num of lines of context when scrolling
opt.undofile = true         -- Save undo history
opt.conceallevel = 2        -- see help conceallevel, but makes nice characters together with the obsidian plugin, todo-lists for exampel.

-- [[ File ]]
opt.encoding = 'utf8'		-- String encoding to use
opt.fileencoding = 'utf8'	-- File encoding to use

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- [[ Theme ]]
opt.termguicolors = true	-- Enables guicolors if term supports

-- [[ Search ]]
opt.ignorecase =  true          -- Ignore case in search patterns
opt.smartcase = true            -- Override ignore case if Capital letter
opt.incsearch = true            -- Use incremental search
opt.hlsearch = false            -- Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true            -- bool: Use spaces instead of tabs
opt.shiftwidth = 4              -- num:  Size of an indent
opt.softtabstop = 4             -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4

