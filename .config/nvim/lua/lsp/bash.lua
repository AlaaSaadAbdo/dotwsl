-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").bashls.setup({
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/bash/node_modules/.bin/bash-language-server", "start" },
  filetypes = { "sh", "zsh" },
  capabilities = capabilities,
})
