require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "cssls",
    "terraformls",
    "dockerls",
    "sumneko_lua",
    "tsserver",
    "bashls",
    "tflint",
    "jsonls",
    "clojure_lsp",
    "efm",
    "rust_analyzer",
  },
})
-- mason has to be configured before using lspconfig
require("lsp.diagnostics")
require("lsp.lua")
require("lsp.efm")
require("lsp.ts")
require("lsp.css")
require("lsp.bash")
require("lsp.rust")
require("lsp.docker")
require("lsp.json")
require("lsp.terraform")
require("lsp.tflint")
require("lsp.python")
require("lsp.clojure")
require("lsp.kotlin")

-- require("lsp.vue")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})
