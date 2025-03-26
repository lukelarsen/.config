return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		-- Customize eslint_d configuration
		lint.linters.eslint_d = {
			name = "customlint",
			-- Command to run eslint_d (override default if needed)
			cmd = "eslint_d",
			-- Arguments to pass to eslint_d
			args = {
				"--format",
				"json", -- Ensure output is in JSON format for nvim-lint to parse
				"--stdin",
				"--stdin-filename",
				function()
					return vim.api.nvim_buf_get_name(0)
				end, -- Pass current file name
			},
			-- Parse JSON output
			stream = "stdout",
			parser = require("lint.parser").json,
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
