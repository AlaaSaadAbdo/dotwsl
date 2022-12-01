local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

require("lspconfig").dockerls.setup({
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/dockerfile/node_modules/.bin/docker-langserver", "--stdio" },
  on_attach = on_attach,
  root_dir = vim.loop.cwd,
  capabilities = capabilities,
})
