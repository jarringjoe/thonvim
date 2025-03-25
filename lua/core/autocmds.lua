-- Highlight text when yanking, this is from TJs video:
	-- https://www.youtube.com/watch?v=_kPg0VBRxJc
vim.api.nvim_create_autocmd('TextYankPost',  {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
