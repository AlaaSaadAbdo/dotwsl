local g = vim.g

g.fzf_nvim_statusline = 0
g.fzf_action = {
  ["ctrl-s"] = "split",
  ["ctrl-v"] = "vsplit",
}

g.fzf_layout = { ["down"] = "~70%" }
g.fzf_preview_window = { "up:60%:sharp", "ctrl-/" }

-- Try later
-- let g:fzf_colors =
-- \ { 'fg':      ['fg', 'Normal'],
--   \ 'bg':      ['bg', 'Normal'],
--   \ 'hl':      ['fg', 'Comment'],
--   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
--   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
--   \ 'hl+':     ['fg', 'Statement'],
--   \ 'info':    ['fg', 'Type'],
--   \ 'border':  ['fg', 'Ignore'],
--   \ 'prompt':  ['fg', 'Character'],
--   \ 'pointer': ['fg', 'Exception'],
--   \ 'marker':  ['fg', 'Keyword'],
--   \ 'spinner': ['fg', 'Label'],
--   \ 'header':  ['fg', 'Comment'] }
