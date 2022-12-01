-- local lspconfig = require("lspconfig")
--
-- lspconfig.pyright.setup({
--     cmd = {
--       vim.fn.stdpath("data") .. "/lsp_servers/python/node_modules/.bin/pyright-langserver",
--       "--stdio",
--     },
--     filetypes = { "python" },
--     root_dir = function(fname)
--       local root_files = {
--         "pyproject.toml",
--         "setup.py",
--         "setup.cfg",
--         "requirements.txt",
--         "Pipfile",
--         "pyrightconfig.json",
--       }
--       return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
--     end,
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           diagnosticMode = "workspace",
--           useLibraryCodeForTypes = true,
--         },
--       },
--     },
-- })
--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").pyright.setup({
  cmd = {
    vim.fn.stdpath("data") .. "/lsp_servers/python/node_modules/.bin/pyright-langserver",
    "--stdio",
  },
  capabilities = capabilities,
})
