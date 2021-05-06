local completion = require("compe")

local dictionary_file = vim.o.dictionary or ""
local word_map = {}
for word in io.lines(dictionary_file) do
   local first = word:sub(1, 1)
   local first_upper = first:upper()
   if not word_map[first] then
      word_map[first] = {}
      word_map[first_upper] = {}
   end
   table.insert(word_map[first], word)
   table.insert(word_map[first_upper], first_upper .. word:sub(2))
end

local Source = {}

function Source.new()
   return setmetatable({}, { __index = Source })
end

function Source:get_metadata()
   return {
      priority = 1,
      menu = "[Dict]",
   }
end

function Source:determine(context)
   return completion.helper.determine(context)
end

function Source:complete(context)
   local first = context.input:sub(1, 1)
   local words = { unpack(word_map[first]) }
   if words then
      context.callback({ items = words })
   end
end

completion.register_source("dictionary", Source)
