return {
	"rmagatti/auto-session",
	enabled = false,
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local session = require("auto-session")
		local telescope = require("telescope")
		local lens = require("auto-session.session-lens")

		session.setup({
			log_level = vim.log.levels.ERROR,
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_session_use_git_branch = false,
			auto_save_enabled = true,
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = {},
			},
		})

		telescope.load_extension("session-lens")

		vim.keymap.set("n", "<C-s>", lens.search_session, {
			noremap = true,
		})
	end,
}
