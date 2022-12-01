-- local lspconfig = require("lspconfig")
--
-- lspconfig.setup({
--   cmd = { vim.fn.stdpath("data") .. "/lsp_servers/typescript/node_modules/.bin/vls" },
--   filetypes = { "vue" },
--   init_options = {
--     config = {
--       css = {},
--       emmet = {},
--       html = {
--         suggest = {},
--       },
--       javascript = {
--         format = {},
--       },
--       stylusSupremacy = {},
--       typescript = {
--         format = {},
--       },
--       vetur = {
--         completion = {
--           autoImport = true,
--           tagCasing = "kebab",
--           useScaffoldSnippets = false,
--         },
--         format = {
--           defaultFormatter = {
--             js = "none",
--             ts = "none",
--           },
--           defaultFormatterOptions = {},
--           scriptInitialIndent = false,
--           styleInitialIndent = false,
--         },
--         useWorkspaceDependencies = false,
--         validation = {
--           script = true,
--           style = true,
--           template = true,
--         },
--       },
--     },
--   },
--   -- root_dir = root_pattern("package.json", "vue.config.js"),
-- })
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").vuels.setup({
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/vue/node_modules/vls/bin/vls" },
  filetypes = { "vue" },
  capabilities = capabilities,
})
