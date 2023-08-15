return {
	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	"moll/vim-bbye",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "rust_analyzer" },
			})
		end,
	},
	-- 	"ms-jpq/coq_nvim",
	{
		"saecki/crates.nvim",
		tag = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	"yamatsum/nvim-cursorline",

	--Rust Development
	"rust-lang/rust.vim", -- Rust syntax highlighting

	--formatter
	"mhartington/formatter.nvim",
	"NMAC427/guess-indent.nvim",
	"gennaro-tedesco/nvim-peekup",
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")

			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},
	--completion
	-- Completion framework:

	-- LSP completion source:
	"hrsh7th/cmp-nvim-lsp",

	-- Useful completion sources:
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-omni",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lua",

	-- Snippets

	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	--fix lsp stuff
	--Debugging
	"nvim-lua/plenary.nvim",
	"nvim-pack/nvim-spectre", -- Useful lua functions used ny lots of plugins
	"mfussenegger/nvim-dap", -- Rust debugging
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

	-- Colorschemes && Syntax Highlighting
	{
		"Shatur/neovim-ayu",
		config = function()
			require("ayu").setup({
				-- Configure Ayu theme to be Mirage
				mirage = true,
				overrides = {},
			})
		end,
	}, -- Colorscheme plugin

	-- Status line
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	"lunarvim/darkplus.nvim",
	--telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
}
