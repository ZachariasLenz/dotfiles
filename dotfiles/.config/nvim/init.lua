-- Add Neovim providers.
vim.g.python3_host_prog = vim.env.HOME .. '/.pyenv/versions/neovim/bin/python'

-- Set leader to <space>.
vim.g.mapleader = ' '

-- Load all plugins.
require('zl.plugins')

-- Force loading of astronauta first.
vim.cmd [[runtime plugin/astronauta.vim]]

-- Load general Neovim auto-commands, mappings and options.
require('zl.autocommands')
require('zl.mappings')
require('zl.options')
