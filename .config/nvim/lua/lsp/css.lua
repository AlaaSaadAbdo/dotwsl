local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

lspconfig.cssls.setup({
  cmd = {
    "node",
    vim.fn.stdpath("data") .. "/lsp_servers/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
    "--stdio",
  },
  filetypes = {
    "css",
    "scss",
    "less",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = lspconfig.util.root_pattern("package.json"),
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})
