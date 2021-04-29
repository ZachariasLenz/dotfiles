local utils = {}

utils.colors = {
   nord0 = '#2E3440',
   nord1 = '#3B4252',
   nord2 = '#434C5E',
   nord3 = '#4C566A',
   nord4 = '#D8DEE9',
   nord5 = '#E5E9F0',
   nord6 = '#ECEFF4',
   nord7 = '#8FBCBB',
   nord8 = '#88C0D0',
   nord9 = '#81A1C1',
   nord10 = '#5E81AC',
   nord11 = '#BF616A',
   nord12 = '#D08770',
   nord13 = '#EBCB8B',
   nord14 = '#A3BE8C',
   nord15 = '#B48EAD',
}

utils.filetypes = {
   lsp = {
      ['markdown.pandoc'] = 'zkls',
      markdown = 'zkls',
      pandoc = 'zkls',
      python = 'pyright',
      sh = 'bashls',
      vim = 'vimls',
   },
   markdown = {
      'markdown', 
      'markdown.pandoc', 
      'pandoc'
   },
   text = {
      'asciidoc',
      'gitcommit',
      'latex',
      'markdown',
      'pandoc',
      'plaintex',
      'rst',
      'tex',
      'text',
      'textile',
   },
}

function utils.contains(table, item)
   if table[item] ~= nil then
      return true
   end

   for _, value in pairs(table) do
      if value == item then
         return true
      end
   end

   return false
end

-- Helper function to set options until
-- https://github.com/neovim/neovim/pull/13479 is merged.
function utils.opt(scope, key, value)
   scopes = {o = vim.o, b = vim.bo, w = vim.wo}
   scopes[scope][key] = value
   if scope ~= 'o' then
      scopes['o'][key] = value
   end
end

function utils.t(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return utils
