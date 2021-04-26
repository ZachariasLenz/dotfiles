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
    config = { "\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1%auto_session_enable_last_session\2\nsetup\17auto-session\frequire\0" },
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
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
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
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    keys = { { "", "<leader>f" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  hop = {
    config = { "\27LJ\2\n—\2\0\0\6\0\f\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0004\5\0\0B\0\5\1K\0\1\0-<cmd>lua require('hop').hint_lines()<CR>\6T-<cmd>lua require('hop').hint_char2()<CR>\6t-<cmd>lua require('hop').hint_words()<CR>\6F-<cmd>lua require('hop').hint_char1()<CR>\6f\6n\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "", "f" }, { "", "F" }, { "", "t" }, { "", "T" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/hop"
  },
  ["indent-blankline.nvim"] = {
    config = { 'vim.g.indent_blankline_char = "‚ñè"' },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["limelight.vim"] = {
    keys = { { "", "<leader>f" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  lspconfig = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18zl.plugin.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/lspconfig"
  },
  neogit = {
    keys = { { "", "<leader>g" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["nord-vim"] = {
    after = { "gitsigns.nvim" },
    only_config = true
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
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.completion\frequire\0" },
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\ní\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17virtual_text\1\0\2\ttext\tüí°\fenabled\1\tsign\1\0\0\1\0\1\fenabled\1\21update_lightbulb\19nvim-lightbulb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb"
  },
  ["nvim-lspupdate"] = {
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
  ["specs.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["thesaurus_query.vim"] = {
    keys = { { "", "<leader>t" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/thesaurus_query.vim"
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
  ["vim-dialect"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-dialect"
  },
  ["vim-doge"] = {
    keys = { { "", "<leader>d" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-doge"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-polyglot"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
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
    keys = { { "", "s" }, { "", "ss" }, { "", "S" }, { "", "<leader>s" }, { "", "<leader>ss" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-subversive"
  },
  ["vim-textobj-sentence"] = {
    config = { "vim.cmd[[call textobj#sentence#init()]]" },
    load_after = {
      ["vim-textobj-user"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-textobj-sentence"
  },
  ["vim-textobj-user"] = {
    after = { "vim-textobj-sentence" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zander/.local/share/nvim/site/pack/packer/opt/vim-textobj-user"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/zander/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

time("Defining packer_plugins", false)
-- Setup for: vim-doge
time("Setup for vim-doge", true)
try_loadstring("\27LJ\2\nq\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\3\0\0\6n\6s\28doge_comment_jump_modes\vgoogle\29doge_doc_standard_python\6g\bvim\0", "setup", "vim-doge")
time("Setup for vim-doge", false)
-- Setup for: neogit
time("Setup for neogit", true)
vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<CR>", {})
time("Setup for neogit", false)
-- Setup for: goyo.vim
time("Setup for goyo.vim", true)
try_loadstring("\27LJ\2\nÍ\1\0\0\6\0\f\0\0216\0\0\0009\0\1\0)\1P\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\14:Goyo<CR>\14<leader>f\6n\20nvim_set_keymap\bapi'autocmd! User GoyoLeave Limelight!&autocmd! User GoyoEnter Limelight\bcmd\15goyo_width\6g\bvim\0", "setup", "goyo.vim")
time("Setup for goyo.vim", false)
-- Setup for: vim-sandwich
time("Setup for vim-sandwich", true)
try_loadstring("\27LJ\2\n|\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0.operator_sandwich_no_default_key_mappings%sandwich_no_default_key_mappings\6g\bvim\0", "setup", "vim-sandwich")
time("Setup for vim-sandwich", false)
-- Setup for: vim-polyglot
time("Setup for vim-polyglot", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23zl.plugin.polyglot\frequire\0", "setup", "vim-polyglot")
time("Setup for vim-polyglot", false)
-- Setup for: thesaurus_query.vim
time("Setup for thesaurus_query.vim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30zl.plugin.thesaurus_query\frequire\0", "setup", "thesaurus_query.vim")
time("Setup for thesaurus_query.vim", false)
-- Setup for: traces.vim
time("Setup for traces.vim", true)
try_loadstring("\27LJ\2\në\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0003winwidth('%') > 160 ? 'bot vnew' : 'bot 10new'\26traces_preview_window\31traces_abolish_integration\6g\bvim\0", "setup", "traces.vim")
time("Setup for traces.vim", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.galaxyline\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: auto-session
time("Config for auto-session", true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1%auto_session_enable_last_session\2\nsetup\17auto-session\frequire\0", "config", "auto-session")
time("Config for auto-session", false)
-- Config for: nordbuddy
time("Config for nordbuddy", true)
try_loadstring("\27LJ\2\nw\0\0\3\0\b\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0'\2\a\0B\0\2\1K\0\1\0\14nordbuddy\16colorscheme\15colorbuddy\frequire\14undercurl\15nord_spell\6g\bvim\0", "config", "nordbuddy")
time("Config for nordbuddy", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25zl.plugin.completion\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24zl.plugin.autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Config for: nord-vim
time("Config for nord-vim", true)
try_loadstring("\27LJ\2\nl\0\0\2\0\5\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0K\0\1\0\25nord_italic_comments\16nord_italic\14nord_bold\6g\bvim\0", "config", "nord-vim")
time("Config for nord-vim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
vim.g.indent_blankline_char = "‚ñè"
time("Config for indent-blankline.nvim", false)
-- Config for: barbar.nvim
time("Config for barbar.nvim", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21zl.plugin.barbar\frequire\0", "config", "barbar.nvim")
time("Config for barbar.nvim", false)
-- Load plugins in order defined by `after`
time("Sequenced loading", true)
vim.cmd [[ packadd gitsigns.nvim ]]

-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23zl.plugin.gitsigns\frequire\0", "config", "gitsigns.nvim")

time("Sequenced loading", false)
-- Keymap lazy-loads
time("Defining lazy-load keymaps", true)
vim.cmd [[noremap <silent> <leader>g <cmd>lua require("packer.load")({'neogit'}, { keys = "<lt>leader>g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>t <cmd>lua require("packer.load")({'thesaurus_query.vim'}, { keys = "<lt>leader>t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> T <cmd>lua require("packer.load")({'hop'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'hop'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'kommentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>f <cmd>lua require("packer.load")({'limelight.vim'}, { keys = "<lt>leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'hop'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'hop'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>f <cmd>lua require("packer.load")({'goyo.vim'}, { keys = "<lt>leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> s <cmd>lua require("packer.load")({'vim-subversive'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ss <cmd>lua require("packer.load")({'vim-subversive'}, { keys = "ss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> S <cmd>lua require("packer.load")({'vim-subversive'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>d <cmd>lua require("packer.load")({'vim-doge'}, { keys = "<lt>leader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>s <cmd>lua require("packer.load")({'vim-subversive'}, { keys = "<lt>leader>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>ss <cmd>lua require("packer.load")({'vim-subversive'}, { keys = "<lt>leader>ss", prefix = "" }, _G.packer_plugins)<cr>]]
time("Defining lazy-load keymaps", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType sh ++once lua require("packer.load")({'lspconfig', 'nvim-lspupdate', 'nvim-lightbulb'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'lspconfig', 'nvim-lspupdate', 'nvim-lightbulb'}, { ft = "sql" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'lspconfig', 'nvim-lspupdate', 'nvim-lightbulb'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType asciidoc ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "asciidoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitcommit ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "gitcommit" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "pandoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType plaintex ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "plaintex" }, _G.packer_plugins)]]
vim.cmd [[au FileType rst ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "rst" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType textile ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "textile" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'lspconfig', 'nvim-lspupdate', 'nvim-lightbulb'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-correction', 'vim-textobj-sentence', 'vim-textobj-user'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'lspconfig', 'nvim-lspupdate', 'nvim-lightbulb'}, { ft = "python" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'traces.vim', 'vim-sandwich', 'vim-polyglot'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'formatter.nvim'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
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
