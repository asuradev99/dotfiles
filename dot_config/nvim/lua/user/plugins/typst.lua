return {
	"kaarmu/typst.vim",
	ft = "typst",
	lazy = false,
	config = function()
		vim.cmd([[
            filetype indent on
            au ColorScheme * hi Error NONE
            let g:typst_pdf_viewer = "evince"
        ]])
	end,
}
