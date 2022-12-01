vim.cmd([[packadd formatter.nvim]])

local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--config-precedence",
      "prefer-file",
      "--single-quote",
      "--prose-wrap",
      "always",
      "--arrow-parens",
      "always",
      "--trailing-comma",
      "all",
      "--semi",
      "--end-of-line",
      "lf",
      "--stdin-filepath",
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = true,
  }
end

-- prettier does what we want now
-- local eslint_d = function()
--   return {
--     exe = "eslint_d",
--     args = { "-f unix", "--stdin", "--stdin-filename ${INPUT}", "--fix-to-stdout" },
--     stdin = true,
--   }
-- end

local yapf = function()
  return {
    exe = "yapf",
    stdin = true,
  }
end

local rustfmt = function()
  return {
    exe = "rustfmt",
    args = { "--emit=stdout" },
    stdin = true,
  }
end

local stylua = function()
  return {
    exe = "stylua",
    args = {
      "--config-path",
      "~/.config/nvim/.stylua",
      "-",
    },
    stdin = true,
  }
end

local shfmt = function()
  return {
    exe = "shfmt",
    args = {
      "-ci",
      "-s",
      "-bn",
    },
    stdin = true,
  }
end

require("formatter").setup({
  logging = true,
  filetype = {
    typescriptreact = { prettier },
    javascriptreact = { prettier },
    javascript = { prettier },
    typescript = { prettier },
    vue = { prettier },
    scss = { prettier },
    css = { prettier },
    -- jsonc = { prettier },
    -- json = { prettier },
    html = { prettier },
    rust = { rustfmt },
    lua = { stylua },
    sh = { shfmt },
    markdown = { prettier },
    python = { yapf },
  },
})
