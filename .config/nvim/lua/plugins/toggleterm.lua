require("toggleterm").setup()
vim.api.nvim_set_keymap("n", "<leader>~", ":ToggleTerm<Cr>", { noremap = true })
