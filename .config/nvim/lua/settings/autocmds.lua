local cmd = vim.cmd
local exec = vim.api.nvim_exec
local function autocmd(event, triggers, operations)
  local fncmd = string.format("autocmd %s %s %s", event, triggers, operations)
  vim.cmd(fncmd)
end

cmd("au TermOpen * setlocal signcolumn=no nonumber")
cmd("au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf")
cmd("au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json")

-- auto format on write
-- cmd("au BufWritePre * lua vim.lsp.buf.formatting()")

-- after write to file keep current unfolded
-- cmd("au BufWritePost * normal! zv")

cmd("au FileType gitcommit setl spell")

cmd("au BufEnter *.txt lua require('settings.utils').help_tab()")
-- Open image file in system preview
cmd([[au BufEnter *.png,*.jpg,*.gif,*.ico exec "silent !open ".expand("%") | :bw"]])

-- Return to last edited line
-- cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]])

cmd("command! LSPReload lua reload_lsp()")
cmd("command! LSPDebug lua print(vim.inspect(vim.lsp.get_active_clients()))")
cmd("command! LSPLog lua open_lsp_log()")

autocmd("CursorHold", "<buffer>", "lua require'lspsaga.diagnostic'.show_line_diagnostics()")

vim.cmd([[
augroup vimrc-incsearch-highlight 
  autocmd! 
  autocmd CmdlineEnter /,\? :set hlsearch 
  autocmd CmdlineLeave /,\? :set nohlsearch 
augroup END
]])

-- vim.cmd([[
-- autocmd! FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
-- ]])

exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.ts,*.tsx,*.js,*.jsx,*.css,*.scss,*.html,*.json FormatWrite
augroup END
]],
  true
)

-- vim.cmd([[
--   augroup LspFormatting
--       autocmd! * <buffer>
--       autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
--   augroup END
-- ]])

-- current word blacklist
cmd("autocmd FileType NvimTree :let b:vim_current_word_disabled_in_this_buffer = 1")

-- -- Startuptime
-- exec(
--   [[
-- if has('vim_starting') && has('reltime')
--    let g:startuptime = reltime()
--    augroup vimrc-startuptime
--      autocmd!
--      autocmd VimEnter * echomsg 'startuptime:' . reltimestr(reltime(g:startuptime))
--    augroup END
-- endif
-- ]],
--   ""
-- )

cmd("autocmd BufNewFile,BufRead * setlocal formatoptions-=1jql")
cmd("autocmd VimResized * wincmd =")
