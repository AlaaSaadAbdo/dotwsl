-- Here is the formatting config
local null_ls = require("null-ls")
local lSsources = {

  -- null_ls.builtins.formatting.prettier.with({
  --   filetypes = {
  --     "javascript",
  --     "typescript",
  --     "javascriptreact",
  --     "typescriptreact",
  --     "vue",
  --     "css",
  --     "scss",
  --     "html",
  --     "json",
  --     "jsonc",
  --     "yaml",
  --     "markdown",
  --     "md",
  --     "txt",
  --   },
  -- }),

  null_ls.builtins.formatting.prettier.with({
    timeout = 10000,
    args = { "--single-quote", "--prose-wrap=always", "--stdin-filepath", "$FILENAME" },
  }),
  null_ls.builtins.formatting.stylua.with({
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
    filetypes = { "lua" },
  }),

  null_ls.builtins.formatting.rustfmt.with({
    filetypes = { "rust" },
  }),

  null_ls.builtins.formatting.shfmt.with({
    args = { "-ci, -s, -bn" },
    filetypes = { "sh" },
  }),

  null_ls.builtins.formatting.yapf.with({
    filetypes = { "python" },
  }),
  null_ls.builtins.formatting.markdownlint,

  null_ls.builtins.diagnostics.shellcheck.with({
    diagnostics_format = "[#{c}] #{m} (#{s})",
  }),

  null_ls.builtins.diagnostics.jsonlint.with({
    filetypes = { "json", "jsonc" },
  }),

  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.gitlint,
  null_ls.builtins.diagnostics.yamllint,
  null_ls.builtins.diagnostics.zsh,
}

require("null-ls").setup({
  debug = true,
  sources = lSsources,
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
    end
  end,
})
