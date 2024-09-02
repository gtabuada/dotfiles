return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    local extensions = require("harpoon.extensions")

    harpoon:setup()
    harpoon:extend(extensions.builtins.command_on_nav("UfoEnableFold"))

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<leader>qq", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>qw", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>qe", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>qr", function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
}
