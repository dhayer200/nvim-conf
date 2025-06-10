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

  -- Math operations
  s("sum", { t "\\sum_{", i(1, "i=1"), t "}^{", i(2, "n"), t "}" }),
  s("lim", { t "\\lim_{", i(1, "x \\to \\infty"), t "}" }),
  s("int", { t "\\int_{", i(1, "a"), t "}^{", i(2, "b"), t "} ", i(3), t " \\mathrm{d}", i(4, "x") }),

  -- Common environments
  s("beg", {
    t "\\begin{",
    i(1),
    t { "}", "  " },
    i(2),
    t { "", "\\end{" },
    i(1),
    t "}",
  }),

  s("ali", {
    t "\\begin{align*}",
    t { "", "  " },
    i(1),
    t { "", "\\end{align*}" },
  }),

  s("cases", {
    t "\\begin{cases}",
    t { "", "  " },
    i(1, "x & x < 0 \\\\"), -- double backslash to produce LaTeX \\
    t { "", "\\end{cases}" },
  }),

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

  s("doc", {
    t { "\\documentclass[a4paper]{article}", "" },
    t {
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage{amsmath}",
      "\\usepackage{amssymb}",
      "\\usepackage{amsfonts}",
      "\\usepackage{mathtools}",
      "\\usepackage{physics}",
      "\\usepackage{bm}",
      "\\usepackage{graphicx}",
      "\\usepackage{tikz}",
      "\\usepackage{siunitx}",
      "\\usepackage{enumitem}",
      "\\usepackage{geometry}",
      "\\geometry{margin=1in}",
      "",
    },
    t "\\title{",
    i(1, "My Title"),
    t "}",
    t { "" },
    t "\\author{",
    i(2, "Author Name"),
    t "}",
    t { "" },
    t "\\date{",
    i(3, "\\today"),
    t "}",
    t { "", "" },
    t "\\begin{document}",
    t { "", "" },
    t "\\maketitle",
    t { "", "" },
    i(4, "Your content here..."),
    t { "", "" },
    t "\\end{document}",
  }),
}
