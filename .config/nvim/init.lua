-- if not vim.g.vscode then
--   require("impatient")
-- end
-- RELOAD = require("plenary.reload").reload_module
-- RTELE = function()
--   RELOAD("module.telescope")
--   RELOAD("telescope")
-- end
require("settings")
if not vim.g.vscode then
  require("plugins")
  require("lsp")
end

vim.cmd("source /home/amanso/.config/nvim/neovide.vim")
