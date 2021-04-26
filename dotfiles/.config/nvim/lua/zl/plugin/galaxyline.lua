local gl = require('galaxyline')
local gl_condition = require('galaxyline.condition')
local gl_fileinfo = require('galaxyline.provider_fileinfo')
local gl_vcs = require('galaxyline.provider_vcs')
local gls = gl.section

local utils = require('zl.utils')
local colors = utils.colors
local contains = utils.contains
local filetypes = utils.filetypes

local function is_programming_file()
   return contains(filetypes.programming, vim.bo.filetype)
end
local function is_text_file()
   return contains(filetypes.text, vim.bo.filetype)
end

local function is_wide()
   if vim.fn.winwidth(0) > 90 then
      return true
   else
      return false
   end
end

gl.short_line_list = {'packer'}

gls.left[1] = {
   LeftBarBegin = {
      highlight = {colors.nord8, colors.nord8},
      provider = function() return '▋' end,
   }
}
gls.left[2] = {
   ViMode = {
      highlight = {colors.nord1, colors.nord8},
      provider = function()
         local mode_colors = {
               n = {colors.nord1, colors.nord8},
               i = {colors.nord1, colors.nord5},
               c = {colors.nord1, colors.nord8},
               s = {colors.nord1, colors.nord7},
               v = {colors.nord1, colors.nord7},
               V = {colors.nord1, colors.nord7},
               [''] = {colors.nord1, colors.nord7},
               R = {colors.nord1, colors.nord13},
         }
         local alias = {
               n = 'NORMAL',
               i = 'INSERT',
               c = 'COMMAND',
               s = 'SELECT',
               v = 'VISUAL',
               V = 'V-LINE',
               [''] = 'V-BLOCK',
               R = 'REPLACE',
         }

         vim.cmd(string.format(
            'hi GalaxyLeftBarBegin guifg=%s guibg=%s',
            mode_colors[vim.fn.mode()][2],
            mode_colors[vim.fn.mode()][2]
         ))
         vim.cmd(string.format(
            'hi GalaxyViMode guifg=%s guibg=%s',
            mode_colors[vim.fn.mode()][1],
            mode_colors[vim.fn.mode()][2]
         ))
         vim.cmd(string.format(
            'hi GalaxyLeftBarMid guifg=%s guibg=%s',
            mode_colors[vim.fn.mode()][2],
            colors.nord1
         ))

         if is_wide() then
            return alias[vim.fn.mode()]
         else
            return string.sub(alias[vim.fn.mode()], 1, 1)
         end
      end,
   }
}
gls.left[3] = {
   LeftBarMid = {
      highlight = {colors.nord8, colors.nord1},
      provider = function() return '▋' end,
      separator = ' ',
      separator_highlight = {colors.nord8, colors.nord1},
   }
}
gls.left[4] = {
   FileType = {
      highlight = {colors.nord5, colors.nord1},
      provider = function()
         if is_programming_file() then
            return gl_fileinfo.get_file_icon()
         elseif is_text_file() then
            return ' '
         else
            return ''
         end
      end
   }
}

gls.left[5] = {
   LspClient = {
      condition = is_programming_file,
      highlight = {colors.nord5, colors.nord1},
      provider = 'GetLspClient',
      separator = ' | ',
      separator_highlight = {colors.nord8, colors.nord1},
   }
}
gls.left[6] = {
   DiagnosticError = {
      condition = is_programming_file,
      highlight = {colors.nord11, colors.nord1},
      icon = ' ',
      provider = 'DiagnosticError',
   }
}
gls.left[7] = {
   DiagnosticWarn = {
      condition = is_programming_file,
      highlight = {colors.nord13, colors.nord1},
      icon = ' ',
      provider = 'DiagnosticWarn',
   }
}
gls.left[8] = {
   DiagnosticHint = {
      condition = is_programming_file,
      highlight = {colors.nord10, colors.nord1},
      icon = ' ',
      provider = 'DiagnosticHint',
   }
}
gls.left[9] = {
   DiagnosticInfo = {
      condition = is_programming_file,
      highlight = {colors.nord8, colors.nord1},
      icon = ' ',
      provider = 'DiagnosticInfo',
      separator = ' ',
      separator_highlight = {colors.nord3, colors.nord3},
   }
}

gls.right[1] = {
   DiffAdd = {
      condition = gl_condition.check_git_workspace,
      highlight = {colors.nord14, colors.nord1},
      icon = ' ',
      provider = 'DiffAdd',
      separator = ' ',
      separator_highlight = {colors.nord1, colors.nord1},
   }
}
gls.right[2] = {
   DiffModified = {
      condition = gl_condition.check_git_workspace,
      highlight = {colors.nord13, colors.nord1},
      icon = ' ',
      provider = 'DiffModified',
   }
}

gls.right[3] = {
   DiffRemove = {
      condition = gl_condition.check_git_workspace,
      highlight = {colors.nord11, colors.nord1},
      icon = ' ',
      provider = 'DiffRemove',
   }
}
gls.right[4] = {
   GitBranch = {
      condition = gl_condition.check_git_workspace,
      highlight = {colors.nord5, colors.nord1},
      icon = ' ',
      provider = function()
         if is_wide() then
            return gl_vcs.get_git_branch()
         else
            return gl_vcs.get_git_branch():sub(1, 20)
         end
      end,
      separator = '| ',
      separator_highlight = {colors.nord8, colors.nord1},
   }
}
gls.right[5] = {
   GitDir = {
      condition = gl_condition.check_git_workspace,
      highlight = {colors.nord5, colors.nord1},
      icon = '  ',
      provider = function()
         if not is_wide() then return '' end
         local git_dir = vim.fn.finddir('.git/..', vim.fn.expand('%:p:h') .. ';')
         local home = vim.env['HOME']
         if git_dir:sub(1, #home) == home then
            return git_dir:sub(#home + 2, #git_dir)
         else
            return git_dir
         end
      end,
      separator = ' ',
      separator_highlight = {colors.nord1, colors.nord1},
   }
}
gls.right[6] = {
   RightBar = {
      provider = function() return '▋' end,
      highlight = {colors.nord8, colors.nord1},
      separator = ' ',
      separator_highlight = {colors.nord1, colors.nord1},
   }
}
