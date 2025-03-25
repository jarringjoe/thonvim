-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            local wk = require("which-key")

            -- 🏷️ Which-Key Mapping using `wk.add()`
            wk.add({
                -- Add and Toggle Harpoon Menu
                { "<leader>a", function() harpoon:list():add() end, desc = "Add file to Harpoon" },
                { "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle Harpoon menu" },

                -- Jump to Harpoon Slots 1-4
                { "<C-h>", function() harpoon:list():select(1) end, desc = "Go to Harpoon Slot 1" },
                { "<C-j>", function() harpoon:list():select(2) end, desc = "Go to Harpoon Slot 2" },
                { "<C-k>", function() harpoon:list():select(3) end, desc = "Go to Harpoon Slot 3" },
                { "<C-l>", function() harpoon:list():select(4) end, desc = "Go to Harpoon Slot 4" },

                -- Toggle Previous & Next Harpoon Buffers
                { "<C-p>", function() harpoon:list():prev() end, desc = "Previous Harpoon file" },
                { "<C-n>", function() harpoon:list():next() end, desc = "Next Harpoon File" },
            })
        end,
    },
}
