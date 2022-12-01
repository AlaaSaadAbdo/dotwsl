-- Allow vim-terraform to align settings automatically with Tabularize.
vim.g.terraform_align = 1
-- Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code. Defaults to 0 which is off.
vim.g.terraform_fold_sections = 1
-- Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the :TerraformFmt command.
vim.g.terraform_fmt_on_save = 1
