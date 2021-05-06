local opt = require("zl.utils").opt

local indent = 3
opt("b", "shiftwidth", indent) -- set '<' and '>' to shift by `indent` spaces
opt("b", "softtabstop", indent) -- set tab character to `indent` spaces
opt("b", "tabstop", indent) -- set tab character to `indent` spaces
