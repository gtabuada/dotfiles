return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defauts = {
				file_ignore_patterns = { "node_modules", "vite.config.ts" },
				-- layout_config = {
				--   horizontal = {
				--     preview_cutoff = 0,
				--   },
				-- },
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, {})
			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end, {})

			vim.keymap.set("n", "<leader>sf", builtin.git_status, {})
			vim.keymap.set("n", "<leader>sC", builtin.git_bcommits, {})
			vim.keymap.set("n", "<leader>sc", builtin.git_commits, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local t = require("telescope")
			t.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			t.load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set(
				"n",
				"<leader>bb",
				":Telescope file_browser path=%:p:h select_buffer=true<CR>",
				{ noremap = true }
			)
		end,
	},
}
