local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("ddef", {
		t("def "),
		i(1, "name"),
		t("("),
		i(2),
		t({ "):", "    " }),
		i(0, "pass"),
	}),

	s("cclass", {
		t("class "),
		i(1, "ClassName"),
		t({ ":", "    def __init__(self" }),
		t(", "),
		i(2),
		t({ "):", "        " }),
		i(0, "pass"),
	}),

	s("pr", {
		t("print("),
		i(1),
		t(")"),
	}),

	s("forr", {
		t("for "),
		i(1, "item"),
		t(" in "),
		i(2, "iterable"),
		t({ ":", "    " }),
		i(3, "pass"),
	}),
}
