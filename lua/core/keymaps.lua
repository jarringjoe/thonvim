-- [[...]] is string formatter, escaping everything inside in lua
local map = vim.keymap.set

vim.g.mapleader = " "                                   -- These keybindings need to be defined before the first
vim.g.localleader = "\\"


-- [[ MOTION ]]
map("i", "jk", "<ESC>", { desc = "Exit insert mode" }) -- 'jk' to exit insert mode

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll half-page down, keep cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll half-page up, keep cursor centered" })

-- [[ TEXT ]]
map({ "n", "v" }, "<leader>y", [["+y"]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y"]], { desc = "Yank line to clipboard" })

map("n", "n", "nzzzv", { desc = "Keep search result centered (next)" }) -- Same as primeage, zz centers line, zv opens folds
map("n", "N", "Nzzzv", { desc = "Keep search result centered (previous)" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quicklist next" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quicklist previous" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Locationlist next" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Locationlist previous" })

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Substitute word under cursor" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })


-- [[ PYTHON ]]
map("n", "<leader>r", ":!python3 %<CR>", { desc = "Run current Python file" })


