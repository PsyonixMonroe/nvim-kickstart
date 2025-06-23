local ls = require("luasnip")

return {
	ls.snippet("func", {
		ls.text_node({ "function()", "\t" }),
		ls.insert_node(1, ""),
		ls.text_node({ "", "end" }),
	}),
}
