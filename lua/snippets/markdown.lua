local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Core math font shortcuts
  s("mk", { t "\\mathcal{", i(1), t "}" }),
  s("bb", { t "\\mathbb{", i(1), t "}" }),
  s("fr", { t "\\frac{", i(1), t "}{", i(2), t "}" }),
  s("sr", { t "\\sqrt{", i(1), t "}" }),
  -- s("dm", {
  --   t({ "\\[", "\t" }),
  --   i(1, "f(x)"),
  --   t({ "", "\\]" }),
  -- })
  -- s("mm", {
  --   t("$"),
  --   i(1, "a^2 + b^2 = c^2"),
  --   t("$"),
  -- })
  --
  -- Math operations
  s("sum", { t "\\sum_{", i(1, "i=1"), t "}^{", i(2, "n"), t "}" }),
  s("lim", { t "\\lim_{", i(1, "x \\to \\infty"), t "}" }),
  s("int", { t "\\int_{", i(1, "a"), t "}^{", i(2, "b"), t "} ", i(3), t " \\mathrm{d}", i(4, "x") }),

  -- Derivative snippet
  s("dd", {
    t "\\frac{\\mathrm{d}",
    i(1, "y"),
    t "}{\\mathrm{d}",
    i(2, "x"),
    t "}",
  }),

  -- Second derivative
  s("ds", {
    t "\\frac{\\mathrm{d}^2",
    i(1, "y"),
    t "}{\\mathrm{d}",
    i(2, "x"),
    t "^2}",
  }),

  -- Standalone dx
  s("dx", { t "\\,\\mathrm{d}", i(1, "x") }),

  -- Partial derivative snippet
  s("pd", {
    t "\\frac{\\partial ",
    i(1, "f"),
    t "}{\\partial ",
    i(2, "x"),
    t "}",
  }),
}
