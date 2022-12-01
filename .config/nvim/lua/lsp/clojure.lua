local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

lspconfig.clojure_lsp.setup({
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/clojure_lsp/clojure-lsp" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "clojure", "edn" },
  root_pattern = { ".git" },
})
