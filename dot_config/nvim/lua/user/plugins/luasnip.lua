return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "1.*",
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local ls = require("luasnip")
		-- some shorthands...
		local snip = ls.snippet
		local node = ls.snippet_node
		local text = ls.text_node
		local insert = ls.insert_node
		local func = ls.function_node
		local choice = ls.choice_node
		local dynamicn = ls.dynamic_node

		local date = function()
			return { os.date("%Y-%m-%d") }
		end

		ls.history = true
		ls.region_check_events = "InsertEnter"
		ls.delete_check_events = "TextChanged, InsertLeave"

		ls.config.set_config({
			region_check_events = "InsertEnter",
			delete_check_events = "InsertLeave",
		})
	end,
}
