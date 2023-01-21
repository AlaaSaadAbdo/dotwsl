local map = require("settings.utils").map
local g = vim.g

-- vim
-- map("n", ",", "<Nop>", { noremap = true })
-- g.mapleader = ","
map("n", "<SPACE>", "<Nop>", { noremap = true })
g.mapleader = " "
-- vim.cmd("nnoremap <CR> :noh<CR><CR>:<backspace>")
map("n", "Q", "<Nop>", { noremap = true })
map("n", "q:", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("v", "x", '"_xa', { noremap = true })
-- vim.cmd("nmap <SPACE>s <c-w>h")
-- vim.cmd("nmap <SPACE>n <c-w>j")
-- vim.cmd("nmap <SPACE>t <c-w>l")
-- vim.cmd("nmap <SPACE>l <c-w>k")
vim.cmd("nmap <SPACE>a <c-w>h")
vim.cmd("nmap <SPACE>e <c-w>j")
vim.cmd("nmap <SPACE>i <c-w>l")
vim.cmd("nmap <SPACE>' <c-w>k")

vim.cmd("nnoremap ,t :vertical res -10<CR>")
vim.cmd("nnoremap ,n :res +10<CR>")
vim.cmd("nnoremap ,s :vertical res +10<CR>")
vim.cmd("nnoremap ,l :res -10<CR>")
-- vim.cmd("nmap <SPACE>y <c-w>=")
-- vim.cmd("nmap <TAB> <C-W>w")
-- vim.cmd("nmap <SPACE>y <c-w>=")
-- vim.cmd("nmap <S-TAB> <C-W>W")

vim.cmd("tmap <C-o> <C-\\><C-n>")

-- vim.cmd("nnoremap <leader>r :lua reload()<CR>")
vim.cmd("nnoremap <leader>r :lua reloadConfig()<CR>")

-- nvimtree
map("n", "<leader>l", ":NvimTreeToggle<CR>", { noremap = true })
map("n", "<leader>dl", ":NvimTreeFindFile<CR>", { noremap = true })

-- lsp
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
-- map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
-- map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
-- map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
-- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
map("n", "<space>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { noremap = true, silent = true })
map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.setloclist()<CR>", { noremap = true, silent = true })

-- fzf-lsp
vim.cmd("nnoremap <silent> gD :Declarations<CR>")
vim.cmd("nnoremap <silent> gd :Definitions<CR>")
vim.cmd("nnoremap <silent> gi :Implmentations<CR>")
vim.cmd("nnoremap <silent> gt :TypeDefinitions<CR>")
vim.cmd("nnoremap <silent> gr :References<CR>")

vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> gK :Lspsaga hover_doc<CR>")
vim.cmd("nnoremap <silent> [d :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> ]d :Lspsaga diagnostic_jump_next<CR>")
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- lsp saga
-- map("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", { noremap = true, silent = true })
-- show signature help
map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { noremap = true, silent = true })
-- rename
-- map("n", "grn", "<cmd>lua require('lspsaga.rename').rename()<CR>", { noremap = true, silent = true })
-- preview definition
-- map("n", "gds", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", { noremap = true, silent = true })

-- FZF
vim.cmd(
  "command! -bang -nargs=* DRg call fzf#vim#grep('rg --column --line-number --hidden --no-heading --color=always --smart-case --no-ignore '.shellescape(<q-args>), 1, fzf#vim#with_preview({'dir': '~/.config'}), <bang>0)"
)

vim.cmd("command! -bang -nargs=? -complete=dir DFiles call fzf#vim#files('~/.config', fzf#vim#with_preview(), <bang>0)")

vim.cmd(
  "command! -bang -nargs=* HRg call fzf#vim#grep('rg --column --line-number --hidden --no-ignore --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 2, fzf#vim#with_preview(), <bang>0)"
)

vim.cmd(
  "command! -bang -nargs=* Rg2 call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)"
)

map("n", "<Leader>bb", ":Buffers<CR>", { noremap = true, silent = true })
map("n", "<Leader>ff", ":Files<CR>", { noremap = true, silent = true })
map("n", "<Leader>fg", ":GFiles<CR>", { noremap = true, silent = true })
vim.cmd("nnoremap <leader>dc :DFiles<CR>")
vim.cmd("nnoremap <leader>dot :DRg<CR>")
vim.cmd("nnoremap <leader>fa :HRg<CR>")

-- Bufferline
vim.cmd("nnoremap <silent>]b :BufferLineCycleNext<CR>")
vim.cmd("nnoremap <silent>[b :BufferLineCyclePrev<CR>")

-- Colorizer
vim.cmd("nnoremap <leader>ck :ColorizerToggle<CR>")

-- Formatter
vim.cmd("nnoremap <Leader>gf :Format<CR>")

-- Search in google MacOs
vim.cmd("nnoremap <silent> <leader>sg :!Open 'http://google.com/search?q='<cword><cr>")

-- use 0 for beginning and end of line
vim.api.nvim_set_keymap("n", "0", "getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^'", {
  silent = true,
  noremap = true,
  expr = true,
})

-- vim-test
vim.cmd("nmap <silent> ,tn :TestNearest<CR>")
vim.cmd("nmap <silent> ,tf :TestFile<CR>")
vim.cmd("nmap <silent> ,ts :TestSuite<CR>")
vim.cmd("nmap <silent> ,tl :TestLast<CR>")

-- spectre
map("n", "<leader>S", ":lua require('spectre').open()<CR>", { noremap = true, silent = true })
map("n", "<leader>sw", "viw:lua require('spectre').open_visual()<CR>", { noremap = true, silent = true })
map("v", "<leader>s", ":lua require('spectre').open_visual()<CR>", { noremap = true, silent = true })
map("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<CR>", { noremap = true, silent = true })

-- gitlinker
vim.api.nvim_set_keymap(
  "n",
  "<leader>gb",
  '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>gb",
  '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  {}
)

-- SSR
vim.keymap.set({ "n", "x" }, "<leader>sr", function()
  require("ssr").open()
end)

-- rooter
vim.cmd("nmap <silent> ,rr :Rooter<CR>")
