return {
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      highlight = {
        keyword = "bg",
      },
    },
  },
}
