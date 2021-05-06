require("true-zen").setup({
   ataraxis = {
      ideal_writing_area_width = 80,
   },
   focus = {
      focus_method = "experimental",
   },
   integrations = {
      integration_galaxyline = true,
      integration_gitsigns = true,
      integration_limelight = true,
      integration_tzfocus_tzataraxis = true,
   },
})
vim.api.nvim_set_keymap(
   "n",
   "<leader>Z",
   "<cmd>TZAtaraxis<CR>",
   { silent = true }
)
