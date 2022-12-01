local g = vim.g
local cmd = vim.cmd

g.NERDSpaceDelims = 1
g.NERDCompactSexyComs = 1
g.NERDDefaultAlign = "left"
g.NERDCommentEmptyLines = 1
g.NERDTrimTrailingWhitespace = 1
g.NERDToggleCheckAllLines = 1

-- figure out why this doesn't work
cmd("let g:NERDCustomDelimiters = { 'json': { 'left': '//', 'right': '' } }")
