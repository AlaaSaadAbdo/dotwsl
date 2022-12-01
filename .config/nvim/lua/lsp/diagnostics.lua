local lsp = vim.lsp

vim.fn.sign_define("LspDiagnosticsSignError", { texthl = "LspDiagnosticsSignError", text = "" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { texthl = "LspDiagnosticsSignWarning", text = "" })
vim.fn.sign_define("LspDiagnosticsSignHint", { texthl = "LspDiagnosticsSignHint", text = "" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { texthl = "LspDiagnosticsSignInformation", text = "" })

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    space = 2,
    prefix = "❮",
  },
  signs = true,
  update_in_insert = false,
})
