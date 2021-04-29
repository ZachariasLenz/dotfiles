" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/zander/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/zander/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/zander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/zander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/zander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21zl.plugin.barbar\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24zl.plugin.formatter\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.galaxyline\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23zl.plugin.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    config = { "\27LJ\2\n‚\1\0\0\6\0\f\0\0216\0\0\0009\0\1\0)\1P\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\14:Goyo<CR>\6L\6n\20nvim_set_keymap\bapi'autocmd! User GoyoLeave Limelight!&autocmd! User GoyoEnter Limelight\bcmd\15goyo_width\6g\bvim\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  hop = {
    config = { "\27LJ\2\nÿ\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\1K\0\1\0-<cmd>lua require('hop').hint_words()<CR>\6H\6n\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys:asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/hop"
  },
  ["indent-blankline.nvim"] = {
    config = { 'vim.g.indent_blankline_char = "‚ñè"' },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nx\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\blua\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  lspconfig = {
    after = { "nvim-lspupdate", "nvim-lightbulb" },
    only_config = true
  },
  neogit = {
    config = { 'vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<CR>", {})' },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/neogit"
  },
  nordbuddy = {
    config = { "\27LJ\2\nw\0\0\3\0\b\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0'\2\a\0B\0\2\1K\0\1\0\14nordbuddy\16colorscheme\15colorbuddy\frequire\14undercurl\15nord_spell\6g\bvim\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nordbuddy"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24zl.plugin.autopairs\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n`\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\25zl.plugin.completion$zl.plugin.completion_dictionary\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\ní\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17virtual_text\1\0\2\fenabled\2\ttext\tüí°\tsign\1\0\0\1\0\1\fenabled\1\21update_lightbulb\19nvim-lightbulb\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb"
  },
  ["nvim-lspupdate"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/nvim-lspupdate"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.treesitter\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\nå\2\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\vsilent\2Q:lua require(\"telescope._extensions.session-lens.main\").search_session()<CR>\14<C-space>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\17shorten_path\1\14previewer\1\nsetup'telescope._extensions.session-lens\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nô\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\24:SymbolsOutline<CR>\agO\6n\20nvim_set_keymap\bapi\bvim\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nÁ\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2E<Cmd>lua require(\"telescope\").extensions.frecency.frecency()<CR>\15<leader>fF\6n\20nvim_set_keymap\bapi\bvim\rfrecency\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim" },
    only_config = true
  },
  ["thesaurus_query.vim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30zl.plugin.thesaurus_query\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/thesaurus_query.vim"
  },
  ["traces.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/traces.vim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-correction"] = {
    after_files = { "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-correction/after/plugin/correction.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-correction"
  },
  ["vim-doge"] = {
    config = { "\27LJ\2\nq\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\3\0\0\6n\6s\28doge_comment_jump_modes\vgoogle\29doge_doc_standard_python\6g\bvim\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-pandoc-syntax"] = {
    config = { "\27LJ\2\nú\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0Hau! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc)let g:pandoc#syntax#conceal#urls = 1\bcmd\bvim\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sandwich"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23zl.plugin.sandwich\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-sandwich"
  },
  ["vim-subversive"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.subversive\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-subversive"
  },
  ["vim-textobj-sentence"] = {
    config = { "vim.cmd[[call textobj#sentence#init()]]" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-textobj-sentence"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-wordmotion"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-wordmotion"
  },
  ["zk.nvim"] = {
    config = { "\27LJ\2\n{\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\16link_format\rwikilink\17fuzzy_finder\14telescope\27enable_default_keymaps\1\nsetup\azk\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/zk.nvim"
  }
}

time("Defining packer_plugins", false)
-- Setup for: vim-sandwich
time("Setup for vim-sandwich", true)
try_loadstring("\27LJ\2\n|\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0.operator_sandwich_no_default_key_mappings%sandwich_no_default_key_mappings\6g\bvim\0", "setup", "vim-sandwich")
time("Setup for vim-sandwich", false)
-- Setup for: traces.vim
time("Setup for traces.vim", true)
try_loadstring("\27LJ\2\në\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0003winwidth('%') > 160 ? 'bot vnew' : 'bot 10new'\26traces_preview_window\31traces_abolish_integration\6g\bvim\0", "setup", "traces.vim")
time("Setup for traces.vim", false)
-- Config for: barbar.nvim
time("Config for barbar.nvim", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21zl.plugin.barbar\frequire\0", "config", "barbar.nvim")
time("Config for barbar.nvim", false)
-- Config for: kommentary
time("Config for kommentary", true)
try_loadstring("\27LJ\2\nx\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\blua\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time("Config for kommentary", false)
-- Config for: goyo.vim
time("Config for goyo.vim", true)
try_loadstring("\27LJ\2\n‚\1\0\0\6\0\f\0\0216\0\0\0009\0\1\0)\1P\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\14:Goyo<CR>\6L\6n\20nvim_set_keymap\bapi'autocmd! User GoyoLeave Limelight!&autocmd! User GoyoEnter Limelight\bcmd\15goyo_width\6g\bvim\0", "config", "goyo.vim")
time("Config for goyo.vim", false)
-- Config for: neogit
time("Config for neogit", true)
vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<CR>", {})
time("Config for neogit", false)
-- Config for: hop
time("Config for hop", true)
try_loadstring("\27LJ\2\nÿ\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\1K\0\1\0-<cmd>lua require('hop').hint_words()<CR>\6H\6n\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys:asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP\nsetup\bhop\frequire\0", "config", "hop")
time("Config for hop", false)
-- Config for: lspconfig
time("Config for lspconfig", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18zl.plugin.lsp\frequire\0", "config", "lspconfig")
time("Config for lspconfig", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.galaxyline\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: session-lens
time("Config for session-lens", true)
try_loadstring("\27LJ\2\nå\2\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\vsilent\2Q:lua require(\"telescope._extensions.session-lens.main\").search_session()<CR>\14<C-space>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\17shorten_path\1\14previewer\1\nsetup'telescope._extensions.session-lens\frequire\0", "config", "session-lens")
time("Config for session-lens", false)
-- Config for: thesaurus_query.vim
time("Config for thesaurus_query.vim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30zl.plugin.thesaurus_query\frequire\0", "config", "thesaurus_query.vim")
time("Config for thesaurus_query.vim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
vim.g.indent_blankline_char = "‚ñè"
time("Config for indent-blankline.nvim", false)
-- Config for: vim-pandoc-syntax
time("Config for vim-pandoc-syntax", true)
try_loadstring("\27LJ\2\nú\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0Hau! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc)let g:pandoc#syntax#conceal#urls = 1\bcmd\bvim\0", "config", "vim-pandoc-syntax")
time("Config for vim-pandoc-syntax", false)
-- Config for: vim-doge
time("Config for vim-doge", true)
try_loadstring("\27LJ\2\nq\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\3\0\0\6n\6s\28doge_comment_jump_modes\vgoogle\29doge_doc_standard_python\6g\bvim\0", "config", "vim-doge")
time("Config for vim-doge", false)
-- Config for: vim-subversive
time("Config for vim-subversive", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.subversive\frequire\0", "config", "vim-subversive")
time("Config for vim-subversive", false)
-- Config for: nordbuddy
time("Config for nordbuddy", true)
try_loadstring("\27LJ\2\nw\0\0\3\0\b\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0'\2\a\0B\0\2\1K\0\1\0\14nordbuddy\16colorscheme\15colorbuddy\frequire\14undercurl\15nord_spell\6g\bvim\0", "config", "nordbuddy")
time("Config for nordbuddy", false)
-- Config for: symbols-outline.nvim
time("Config for symbols-outline.nvim", true)
try_loadstring("\27LJ\2\nô\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\24:SymbolsOutline<CR>\agO\6n\20nvim_set_keymap\bapi\bvim\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time("Config for symbols-outline.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n`\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\25zl.plugin.completion$zl.plugin.completion_dictionary\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24zl.plugin.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23zl.plugin.gitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: formatter.nvim
time("Config for formatter.nvim", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24zl.plugin.formatter\frequire\0", "config", "formatter.nvim")
time("Config for formatter.nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24zl.plugin.autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Conditional loads
time("Condition for { 'vim-wordmotion' }", true)
if
try_loadstring("\27LJ\2\np\0\0\5\0\b\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\3\3\0009\3\4\0036\4\5\0009\4\6\0049\4\a\4B\1\3\2\19\1\1\0L\1\2\0\rfiletype\abo\bvim\ttext\14filetypes\rcontains\rzl.utils\frequire\0", "condition", '{ "vim-wordmotion" }')
then
time("Condition for { 'vim-wordmotion' }", false)
time("packadd for vim-wordmotion", true)
		vim.cmd [[packadd vim-wordmotion]]
	time("packadd for vim-wordmotion", false)
else
time("Condition for { 'vim-wordmotion' }", false)
end
-- Load plugins in order defined by `after`
time("Sequenced loading", true)
vim.cmd [[ packadd telescope-frecency.nvim ]]

-- Config for: telescope-frecency.nvim
try_loadstring("\27LJ\2\nÁ\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2E<Cmd>lua require(\"telescope\").extensions.frecency.frecency()<CR>\15<leader>fF\6n\20nvim_set_keymap\bapi\bvim\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")

vim.cmd [[ packadd nvim-lightbulb ]]

-- Config for: nvim-lightbulb
try_loadstring("\27LJ\2\ní\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17virtual_text\1\0\2\fenabled\2\ttext\tüí°\tsign\1\0\0\1\0\1\fenabled\1\21update_lightbulb\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")

vim.cmd [[ packadd nvim-lspupdate ]]
time("Sequenced loading", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType rst ++once lua require("packer.load")({'vim-correction'}, { ft = "rst" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-correction'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType textile ++once lua require("packer.load")({'vim-correction'}, { ft = "textile" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-correction'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-correction', 'zk.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc ++once lua require("packer.load")({'vim-correction'}, { ft = "pandoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType asciidoc ++once lua require("packer.load")({'vim-correction'}, { ft = "asciidoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitcommit ++once lua require("packer.load")({'vim-correction'}, { ft = "gitcommit" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'vim-correction'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType plaintex ++once lua require("packer.load")({'vim-correction'}, { ft = "plaintex" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-sandwich', 'traces.vim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time("Defining lazy-load event autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
