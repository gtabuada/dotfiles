return {
	"stevearc/oil.nvim",
	-- enabled = false,
	opts = {
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name) -- (name, bufnr)
				local blacklist = { "node_modules", ".git" }

				for _, b in ipairs(blacklist) do
					if b == name then
						return true
					end
					return false
				end
			end,
		},
	},
	keys = {
		{
			"-",
			"<CMD>Oil<CR>",
			desc = "Oil: open",
		},
	},
}
