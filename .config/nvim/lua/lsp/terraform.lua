local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").terraformls.setup({
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/terraform/terraform-ls", "serve" },
  filetypes = { "terraform", "hcl" },
  capabilities = capabilities,
})
