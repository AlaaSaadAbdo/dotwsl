local util = require("lspconfig/util")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
}

local flake8 = {
  lintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
}

local markdownlint = {
  lintCommand = "markdownlint -s",
  lintStdin = true,
}

local shellcheck = {
  LintCommand = "shellcheck -f gcc -x",
  lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

lspconfig.efm.setup({
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/efm/efm-langserver" },
  capabilities = capabilities,
  init_options = {
    documentFormatting = false,
    codeAction = true,
  },
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "sh",
    "zsh",
    "markdown",
    "python",
  },
  settings = {
    rootMarkers = { "package.json", ".git" },
    lintDebounce = 500,
    languages = {
      typescript = { eslint_d },
      javascript = { eslint_d },
      typescriptreact = { eslint_d },
      javascriptreact = { eslint_d },
      markdown = { markdownlint },
      sh = { shellcheck },
      python = { flake8 },
      -- zsh = { shellcheck },
    },
  },
})
