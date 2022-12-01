local g = vim.g

g.indent_blankline_char = ""
g.indent_blankline_use_treesitter = true
-- g.indent_blankline_show_current_context = true
g.indent_blankline_filetype_exclude = {
  "help",
  "lspsagafinder",
  "markdown",
  "vimwiki",
  "man",
  "fzf",
  "floaterm",
  "ranger",
  "NvimTree",
  "popup",
  "packer",
  "terminal",
  "lspinfo",
  "dbui",
}
