require("bufferline").setup({
  options = {
    view = "default",
    numbers = "none",
    buffer_close_icon = "",
    close_icon = "",
    -- indicator_icon = " ",
    indicator = { icon = "▎" },
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict)
      return "(" .. count .. ")"
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    maximum_padding = 2,
  },
})
