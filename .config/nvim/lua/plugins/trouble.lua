return {
	"folke/trouble.nvim",
	config = function()
		local t = require("trouble")
		local map = vim.keymap.set
		local opts = { skip_groups = true, jump = true }

		map("n", "<leader>tt", function()
			t.toggle("diagnostics")
		end)

		map("n", "<leader>tn", function()
			t.next(opts)
		end)
		map("n", "<leader>tp", function()
			t.previous(opts)
		end)

		t.setup({
			focus = true,
			warn_no_results = false,
			open_no_results = true,
		})
	end,
}
