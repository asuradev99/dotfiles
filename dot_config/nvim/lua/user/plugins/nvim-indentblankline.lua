return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local highlight = {
			"RainbowOrange",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		end)

		require("ibl").setup({
			indent = {
				char = "▌",
			},
			scope = {
				highlight = highlight,
			},
		})
	end,
}
