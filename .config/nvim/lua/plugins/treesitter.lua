local ts = require("nvim-treesitter.configs")

ts.setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
    use_languagetree = false,
    disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  indent = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = false,
    lint_events = { "BufWrite", "CursorHold" },
  },
  refactor = {
    highlight_definitions = { enable = false },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 500, -- Do not enable for files with more than 1000 lines, int
  },
})
