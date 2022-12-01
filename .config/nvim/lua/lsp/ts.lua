local lspconfig = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false

  local ts_utils = require("nvim-lsp-ts-utils")
  -- defaults
  ts_utils.setup({
    debug = false,
    disable_commands = false,
    import_on_completion_timeout = 5000,

    import_all_timeout = 5000, -- ms
    import_all_priorities = {
      buffers = 4, -- loaded buffer names
      buffer_content = 3, -- loaded buffer content
      local_files = 2, -- git files or files with relative path markers
      same_file = 1, -- add to existing import statement
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,

    -- eslint
    eslint_enable_diagnostics = false,
    eslint_diagnostics_debounce = 250,
    eslint_enable_code_actions = true,
    eslint_enable_disable_comments = true,
    eslint_bin = "eslint",
    eslint_args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
    eslint_config_fallback = nil,
    eslint_show_rule_id = false,

    -- formatting
    enable_formatting = false,

    -- parentheses completion
    complete_parens = false,
    signature_help_in_parens = false,

    -- update imports on file move
    update_imports_on_move = true,
    require_confirmation_on_move = true,
    watch_dir = "/src",
  })

  -- required to enable ESLint code actions and formatting
  ts_utils.setup_client(client)

  local opts = { silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "tgs", ":TSLspOrganize<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "tgr", ":TSLspRenameFile<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "tgi", ":TSLspImportAll<CR>", opts)
end

lspconfig.tsserver.setup({
  cmd = { vim.fn.stdpath("data") .. "/lsp_servers/tsserver/node_modules/.bin/typescript-language-server", "--stdio" },
  -- on_attach = on_attach,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  capabilities = capabilities,
  settings = { documentFormatting = false },
  on_attach = on_attach,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
})
