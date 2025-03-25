-- Tree-sitter is a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.
-- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it.
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    {
    'nvim-treesitter/nvim-treesitter',
    enabled = true,
    lazy = false,
    config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
    end
    },
}
