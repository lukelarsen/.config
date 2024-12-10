return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		signs = {
			error = "",
			warning = "",
			hint = "󰠠",
			information = "",
			other = "",
		},
	},
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open/close trouble list" },
		{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble buffer diagnostics" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
	},
}
