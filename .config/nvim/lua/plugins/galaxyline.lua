local gl = require("galaxyline")
local gruvbox = {
  bg = "#262727",
  fg = "#ebdbb2",
  yellow = "#fabd2f",
  dark_yellow = "#d79921",
  cyan = "#8ec07c",
  green = "#98971a",
  light_green = "#b8bb26",
  string_orange = "#CE9178",
  orange = "#fe8019",
  purple = "#d3869b",
  magenta = "#b16286",
  grey = "#928374",
  blue = "#83a598",
  vivid_blue = "#458588",
  light_blue = "#9CDCFE",
  red = "#fb4934",
  error_red = "#cc241d",
  info_yellow = "#fabd2f",
}
local github_dimmed = {
  -- bg = "#22272e",
  -- bg = "#262b33",
  bg = "#2d333b",
  fg = "#768390",
  yellow = "#daaa3f",
  dark_yellow = "#c69026",
  cyan = "#39c5cf",
  green = "#57ab5a",
  light_green = "#6bc46d",
  string_orange = "#CE9178",
  orange = "#fe8019",
  purple = "#b083f0",
  magenta = "#dcbdfb",
  grey = "#636e7b",
  blue = "#539bf5",
  vivid_blue = "#6cb6ff",
  light_blue = "#458588",
  red = "#fb4934",
  error_red = "#cc241d",
  info_yellow = "#fabd2f",
}
local colors = gruvbox
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

gls.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "N ",
        i = "I ",
        V = "V ",
        [""] = "V ",
        v = "V ",
        c = "C ",
        ["r?"] = ":CONFIRM ",
        rm = "--MORE ",
        R = "REPLACE ",
        Rv = "VIRTUAL ",
        s = "SELECT ",
        S = "SELECT ",
        ["r"] = "HIT-ENTER ",
        [""] = "SELECT ",
        t = "TERMINAL ",
        ["!"] = "SHELL ",
      }
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.purple,
        [""] = colors.purple,
        V = colors.purple,
        c = colors.magenta,
        no = colors.blue,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.red,
        cv = colors.blue,
        ce = colors.blue,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.blue,
        t = colors.blue,
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      return "▊" .. alias[vim.fn.mode()]
    end,
    highlight = { colors.red, colors.bg },
  },
}
print(vim.fn.getbufvar(0, "ts"))
vim.fn.getbufvar(0, "ts")

gls.left[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = { require("galaxyline.providers.fileinfo").get_file_icon_color, colors.bg },
  },
}
gls.left[3] = {
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.fg, colors.bg, "bold" },
  },
}

gls.left[4] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.orange, colors.bg },
  },
}

gls.left[5] = {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}

gls.left[6] = {
  DiffAdd = {
    provider = "DiffAdd",
    -- condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.green, colors.bg },
  },
}
gls.left[7] = {
  DiffModified = {
    provider = "DiffModified",
    -- condition = condition.hide_in_width,
    icon = " 柳",
    highlight = { colors.blue, colors.bg },
  },
}
gls.left[8] = {
  DiffRemove = {
    provider = "DiffRemove",
    -- condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
}

gls.right[1] = {
  DiagnosticError = { provider = "DiagnosticError", icon = "  ", highlight = { colors.error_red, colors.bg } },
}
gls.right[2] = {
  DiagnosticWarn = { provider = "DiagnosticWarn", icon = "  ", highlight = { colors.orange, colors.bg } },
}

gls.right[3] = {
  DiagnosticHint = { provider = "DiagnosticHint", icon = "  ", highlight = { colors.vivid_blue, colors.bg } },
}

gls.right[4] = {
  DiagnosticInfo = { provider = "DiagnosticInfo", icon = "  ", highlight = { colors.info_yellow, colors.bg } },
}

gls.right[5] = {
  ShowLspClient = {
    provider = "GetLspClient",
    condition = function()
      local tbl = { ["dashboard"] = true, [" "] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = "  ",
    highlight = { colors.grey, colors.bg },
  },
}

-- gls.right[7] = {
--   PerCent = {
--     provider = "LinePercent",
--     separator = " ",
--     separator_highlight = {"NONE", colors.bg},
--     highlight = {colors.grey, colors.bg}
--   }
-- }

gls.right[7] = {
  BufferType = {
    provider = "FileTypeName",
    -- condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}

gls.right[8] = {
  FileEncode = {
    provider = "FileEncode",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}

gls.right[9] = {
  ScrollBar = {
    provider = "ScrollBar",
    separator = " ",
    condition = condition.buffer_not_empty,
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.blue, colors.bg },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}

gls.short_line_left[2] = {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.grey, colors.bg },
  },
}

gls.short_line_right[1] = { BufferIcon = { provider = "BufferIcon", highlight = { colors.grey, colors.bg } } }
