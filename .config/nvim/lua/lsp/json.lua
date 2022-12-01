local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").jsonls.setup({
  cmd = {
    "node",
    vim.fn.stdpath("data") .. "/lsp_servers/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    "--stdio",
  },
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
      end,
    },
  },
})
