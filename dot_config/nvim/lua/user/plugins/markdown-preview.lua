return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	enabled = true,
	ft = "markdown",
	config = function()
		local g = vim.g

		g.mkdp_auto_start = 1
	end,
}
