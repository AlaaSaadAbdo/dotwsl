local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    layout_strategy = "flex",
    scroll_strategy = "cycle",
    winblend = 0,
    layout_config = {
      vertical = {
        mirror = true,
      },
    },
    mappings = {
      i = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,

        ["<C-Down>"] = actions.cycle_history_next,
        ["<C-Up>"] = actions.cycle_history_prev,

        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, -- + my_cool_custom_action.x,
        ["<a-q>"] = false,
        ["<esc>"] = actions.close,
      },
    },
    file_ignore_patterns = { "build", "tags", "src/parser.c" },
    color_devicons = true,
    dynamic_preview_title = true,
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    file_browser = {
      theme = "dropdown",
      previewer = false,
    },
    git_files = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      selection_strategy = "closest",
      previewer = false,
      mappings = {
        i = { ["<c-d>"] = actions.delete_buffer },
      },
    },
    lsp_references = { shorten_path = true },
    lsp_document_symbols = { symbol_width = 1, shorten_path = true },
    lsp_workspace_symbols = { shorten_path = true },
    lsp_code_actions = { theme = "dropdown" },
    current_buffer_fuzzy_find = { theme = "dropdown", previewer = false },
  },
  extensions = {
    frecency = {
      persistent_filter = false,
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*", "*.foo" },
      workspaces = {
        ["conf"] = "/home/conni/.config",
        ["nvim"] = "/home/conni/.config/nvim/plugged",
        ["data"] = "/home/conni/.local/share",
        ["project"] = "/home/conni/repos",
      },
    },
  },
})

telescope.load_extension("smart_history")
telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("octo")

local map = require("settings.utils").map

vim.cmd("nnoremap <Leader>tw  <cmd>lua RTELE(); require'telescope.builtin'.git_files{}<CR>")
vim.cmd("nnoremap <Leader>tq  <cmd>lua RTELE(); require'telescope.builtin'.find_files{}<CR>")
vim.cmd(
  "nnoremap <Leader>gp <cmd>lua RTELE(); require'telescope.builtin'.grep_string{ word_match = \"-w\", search = '' }<CR>"
)
vim.cmd("nnoremap <Leader>gw <cmd>lua RTELE(); require'telescope.builtin'.grep_string{ word_match = \"-w\" }<CR>")
vim.cmd(
  "nnoremap <Leader>gs <cmd>lua RTELE(); require'telescope.builtin'.grep_string{ search = vim.fn.input(\"Grep For >\") }<CR>"
)
vim.cmd("nnoremap <leader>tp <cmd>lua RTELE(); require'telescope.builtin'.tags{}<CR>")
vim.cmd("nnoremap <leader>td <cmd>lua RTELE(); require'telescope.builtin'.current_buffer_tags{}<CR>")
vim.cmd("nnoremap <leader>ae <cmd>lua RTELE(); require'telescope.builtin'.loclist{}<CR>")
vim.cmd("nnoremap <leader>bg <cmd>lua RTELE(); require'telescope.builtin'.buffers{}<CR>")
vim.cmd("nnoremap <leader>bs <cmd>lua RTELE(); require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>")

local opts = { noremap = true, silent = true }

map("n", "<Leader>ar", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
map("n", "<leader>ac", "<cmd>lua RTELE(); require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
map(
  "n",
  "<leader>aw",
  "<cmd>lua RTELE(); require'telescope.builtin'.lsp_workspace_symbols{ query = vim.fn.input('Query >') }<CR>",
  opts
)
map("n", "<leader>aa", "<cmd>lua RTELE(); require'telescope.builtin'.lsp_code_actions{}<cr>", opts)
