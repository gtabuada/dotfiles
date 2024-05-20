return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				noice = true,
				notify = true,
				fidget = true,
				harpoon = true,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
				},
				telescope = {
					enabled = true,
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
