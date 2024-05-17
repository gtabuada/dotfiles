return {
	"rcarriga/nvim-notify",
	enabled = false,
	config = function()
		local n = require("notify")
		n.setup({
			minimum_width = 40,
			render = "compact",
			stages = "fade",
			timeout = 3000,
		})
		vim.notify = n
	end,
}
