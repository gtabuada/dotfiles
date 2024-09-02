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
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (telescope)" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags (telescope)" })
      vim.keymap.set("n", "<leader>pws", function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end, { desc = "Grep word under cursor" })
      vim.keymap.set("n", "<leader>pWs", function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end, { desc = "Grep WORD under cursor" })

      vim.keymap.set("n", "<leader>sf", builtin.git_status, { desc = "Git status (telescope)" })
      vim.keymap.set("n", "<leader>sC", builtin.git_bcommits, { desc = "Git commits (telescope)" })
      vim.keymap.set("n", "<leader>sc", builtin.git_commits, { desc = "Git commids (telescope)" })
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
        { noremap = true, desc = "Telescope File Browser" }
      )
    end,
  },
}
