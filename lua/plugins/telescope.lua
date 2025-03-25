-- Gaze deeply into unknown regions using the power of the moon.
-- https://github.com/nvim-telescope/telescope.nvim

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "Telescope find marks" })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope find oldfiles" })
            vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Telescope find in current buffer" })
            vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Telescope git commits" })
            vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Telescope git status" })
        end
}
