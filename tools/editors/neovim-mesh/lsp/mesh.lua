local mesh = require('mesh')

return {
  cmd = mesh.start_rpc,
  filetypes = { 'mesh' },
  root_markers = { 'main.mpl', '.git' },
  workspace_required = false,
}
