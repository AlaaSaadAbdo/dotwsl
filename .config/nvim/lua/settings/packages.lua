-- local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
--
-- if fn.empty(fn.glob(install_path)) > 0 then
--   exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
--   exec("packadd packer.nvim")
-- end
--
-- cmd("packadd packer.nvim")
--
-- cmd("au BufWritePost packages.lua PackerCompile")
--
-- local init = {
--   -- Packer can manage itself as an optional plugin
--   "wbthomason/packer.nvim",
--   opt = true,
-- }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lsp = {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "tsuyoshicho/vim-efm-langserver-settings", -- trying to use it for linting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-refactor",
  "folke/lsp-colors.nvim",
  "folke/trouble.nvim",
  "tami5/lspsaga.nvim",
  "gfanto/fzf-lsp.nvim",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  "udalov/kotlin-vim",
}

local git = {
  "akinsho/git-conflict.nvim",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
  "TimUntersberger/neogit",
  "tanvirtin/vgit.nvim",
}

local misc = {
  "tweekmonster/startuptime.vim", -- benchmark startup
  "voldikss/vim-floaterm",
  "norcalli/nvim-colorizer.lua",
  "mbbill/undotree",
  "lukas-reineke/indent-blankline.nvim",
  "dominikduda/vim_current_word",
  "ethanholz/nvim-lastplace",
  "tpope/vim-unimpaired",
  "AndrewRadev/splitjoin.vim",
  "ruifm/gitlinker.nvim",
  "airblade/vim-rooter",
  {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    -- Calling setup is optional.
    config = function()
      require("ssr").setup({
        min_width = 50,
        min_height = 5,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_all = "<leader><cr>",
        },
      })
    end,
  },
  {
    "tamton-aquib/duck.nvim",
    config = function()
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch()
      end, {})
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, {})
    end,
  },
  -- "lewis6991/impatient.nvim",
  "antoinemadec/FixCursorHold.nvim",
  "simrat39/symbols-outline.nvim",
  "nvim-telescope/telescope.nvim",
}

local text = {
  "scrooloose/nerdcommenter",
  "AndrewRadev/tagalong.vim",
  "machakann/vim-sandwich",
  "alvan/vim-closetag",
  "andymass/vim-matchup",
  "leafOfTree/vim-matchtag",
  "windwp/nvim-autopairs",
  "mhartington/formatter.nvim",
  "vimwiki/vimwiki",
}

local fzf = {
  { "junegunn/fzf", build = "./install --all" }, -- Fuzzy Searcher
  "junegunn/fzf.vim",
}

local test = {
  "janko/vim-test",
}

local themes = {
  "sainnhe/gruvbox-material",
  "sainnhe/everforest",
  { "akinsho/toggleterm.nvim" },
  { "rose-pine/neovim", as = "rose-pine" },
  { "wuelnerdotexe/vim-enfocado" },
}

local ui = {
  "kyazdani42/nvim-web-devicons",
  "NTBBloodbath/galaxyline.nvim",
  "nvim-lualine/lualine.nvim",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
  "p00f/nvim-ts-rainbow", -- this changes the highlight of definitions and todo to black text, maybe it should be loaded before the colorscheme
  -- "yamatsum/nvim-nonicons",
}

local lang = {
  "hashivim/vim-terraform",
  "cespare/vim-toml",
}

local completion = {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "hrsh7th/cmp-cmdline",
  "rafamadriz/friendly-snippets",
}

local trial = {
  "nvim-pack/nvim-spectre",
  "ThePrimeagen/refactoring.nvim",
  -- "jose-elias-alvarez/null-ls.nvim", -- didn't work consistently try again later
  "nvim-orgmode/orgmode",
}

local db = {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
}

-- nothing under developement
-- local localplugins = {
-- }

local lazy = require("lazy")
lazy.setup({
  -- init,
  lsp,
  git,
  misc,
  fzf,
  completion,
  themes,
  ui,
  text,
  lang,
  trial,
  test,
  -- db,
  -- localplugins
})
