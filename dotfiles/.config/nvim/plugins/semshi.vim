"##################################
"# Adds semantic syntax highlight #
"##################################
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

let g:semshi#error_sign = v:false
let g:semshi#excluded_hl_groups = ['local', 'free', 'attribute']
