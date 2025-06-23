return {
	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local ls = require("luasnip")
			ls.setup({})
			ls.filetype_extend("javascript", { "javascriptreact" })
			ls.add_snippets("lua", require("snippets.lua"))
		end,
	},
}
