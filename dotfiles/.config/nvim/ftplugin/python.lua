local opt = require('zl.utils').opt

local text_width = 88                              -- Use a text width of 88
opt('w', 'colorcolumn', tostring(text_width + 1))  -- colour characters just after text width to easily see too long lines
opt('b', 'textwidth', text_width)                  -- set max line width
