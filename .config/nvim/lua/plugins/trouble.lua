return {
	"folke/trouble.nvim",
	opts = {
		signs = {
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
	},
	config = function()
		local t = require("trouble")
		local map = vim.keymap.set
		local opts = { skip_groups = true, jump = true }

		map("n", "<leader>tt", function()
			t.toggle()
		end)
		map("n", "<leader>tn", function()
			t.next(opts)
		end)
		map("n", "<leader>tp", function()
			t.previous(opts)
		end)
	end,
}
