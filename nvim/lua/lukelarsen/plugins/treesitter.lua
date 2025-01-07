return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	-- tag = "v0.9.3",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},

			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},

			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"scss",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		-- vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

		-- Highlight the @foo.bar capture group with the "Identifier" highlight group
		vim.api.nvim_set_hl(0, "@keyword.import.tsx", { link = "NightflyWatermelon" })
		vim.api.nvim_set_hl(0, "@keyword.import.typescript", { link = "NightflyWatermelon" })
		vim.api.nvim_set_hl(0, "@keyword.import.jsx", { link = "NightflyWatermelon" })
		vim.api.nvim_set_hl(0, "@keyword.import.javascript", { link = "NightflyWatermelon" })
		vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.typescriptreact", { link = "NightflyBlue" })
		vim.api.nvim_set_hl(0, "@variable.member.tsx", { link = "NightflyMalibu" })
		vim.api.nvim_set_hl(0, "@variable.tsx", { link = "NightflyEmerald" })
		vim.api.nvim_set_hl(0, "@variable.typescript", { link = "NightflyEmerald" })
		vim.api.nvim_set_hl(0, "@variable.jsx", { link = "NightflyEmerald" })
		vim.api.nvim_set_hl(0, "@variable.javascript", { link = "NightflyEmerald" })
	end,
}
