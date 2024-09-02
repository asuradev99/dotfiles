return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false,
	config = function()
		local bufnr = vim.api.nvim_get_current_buf()
		vim.keymap.set("n", "<leader>a", function()
			vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
			-- or vim.lsp.buf.codeAction() if you don't want grouping.
		end, { silent = true, buffer = bufnr })

		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
				on_attach = function(client, bufnr)
					-- you can also put keymaps in here
				end,
				default_settings = {
--									rust-analyzer language server configuration
					["rust-analyzer"] = {
						cargo = {
							target = "wasm32",
						},
						procMacro = {
							enable = true,
						},
					},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
