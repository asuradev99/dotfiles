return {
	"kaarmu/typst.vim",
	ft = "typst",
	lazy = false,
	config = function()
		vim.cmd([[
            filetype indent on
            let g:typst_pdf_viewer = "zathura"
        ]])
	end,
}
