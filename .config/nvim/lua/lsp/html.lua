local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

lspconfig.html.setup({
  cmd = {
    "node",
    vim.fn.stdpath("data") .. "/lsp_servers/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
    "--stdio",
  },
  filetypes = { "html", "tsx", "jsx", "javascriptreact", "typescriptreact" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
  settings = {},
  on_attach = on_attach,
  capabilities = capabilities,
})
