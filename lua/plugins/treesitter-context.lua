return {
    'nvim-treesitter/nvim-treesitter-context',
    ft = {"python", "markdown", "json", "lua", "sql"},
    config = function()
        local context = require'treesitter-context'
        context.setup()
    end
}
