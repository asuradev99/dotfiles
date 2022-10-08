local fn = vim.fn
-- vim.g.loaded = 1

-- vim.g.loaded_netrwPlugin = 1

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
   -- use {
  --  'romgrk/barbar.nvim',
   -- requires = {'kyazdani42/nvim-web-devicons'}
   --}
  use {
      "akinsho/bufferline.nvim", 
      tag = "v2.*", 
      requires = 'kyazdani42/nvim-web-devicons'
    }
  use "moll/vim-bbye"

  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
   use "neovim/nvim-lspconfig" -- Language server setup
  use "ms-jpq/coq_nvim"
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
   use {
       'numToStr/Comment.nvim',
       config = function()
           require('Comment').setup()
       end
   }

  use "yamatsum/nvim-cursorline"
  --Rust Development
  use "rust-lang/rust.vim" -- Rust syntax highlighting
  use "simrat39/rust-tools.nvim" -- Rust IDE tools
  
  --Debugging

  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'mfussenegger/nvim-dap' -- Rust debugging
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
 
  -- Colorschemes && Syntax Highlighting
  use "Shatur/neovim-ayu" -- Colorscheme plugin
  use "nvim-treesitter/nvim-treesitter"

  -- Status line 
  use {
      "nvim-lualine/lualine.nvim",
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
        
     -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
          end
    
end)

