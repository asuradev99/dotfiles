return {
	"lervag/vimtex",
	config = function()
		vim.cmd([[
            filetype plugin indent on
            syntax enable
            let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
            let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

            let g:tex_flavor='latex'
            let g:Tex_DefaultTargetFormat='pdf'
            let g:Tex_CompileRule_pdf='pdflatex'
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_matchparen_enabled=0
            let g:vimtex_delim_stopline=1
            let g:vimtex_syntax_enabled = 0



        ]])
	end,
}

-- If on laptop:  let g:vimtex_view_method = 'zathura'
