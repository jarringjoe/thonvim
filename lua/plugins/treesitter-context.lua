return {
    'nvim-treesitter/nvim-treesitter-context',
    ft = {"python", "markdown", "json", "lua"},
    config = function()
        local context = require'treesitter-context'
        context.setup()
    end
}
