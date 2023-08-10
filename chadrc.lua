--@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'palenight',
  nvdash = require("custom.configs.nvdash_conf"),
}
M.plugins = 'custom.plugins'
M.mappings = {}
M.mappings.telescope = require('custom.configs.mapping').telescope
return M
