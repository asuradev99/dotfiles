return {
	"stevearc/aerial.nvim",
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR><cmd>AerialOpen<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR><cmd>AerialOpen<CR>", { buffer = bufnr })
			end,
            close_automatic_events = {"unfocus", "switch_buffer", "unsupported"}
		})
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
	end,
}
