return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "lua", "go", "tsx", "typescript", "javascript", "sql", "astro" },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      on_config_done = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.ejs = {
          install_info = {
            url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
            files = { "src/parser.c" },
            requires_generate_from_grammar = true,
          },
          filetype = "ejs",
        }
      end,
    })
  end,
}
