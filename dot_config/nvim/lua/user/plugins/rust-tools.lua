return {
	"simrat39/rust-tools.nvim", -- Rust IDE tools
	config = function()
		local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

		local rt = require("rust-tools")

		rt.setup({
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					-- Code action groups
				end,
			},
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		})

        require('rust-tools').inlay_hints.enable()
	end,
}

