local M = {}

M.setup = function(user_config)
  require("darkvoid.colors").extend(user_config or {})
end

M.load = function(user_config)
  local config = require("darkvoid.colors").config
  if user_config then
    vim.tbl_deep_extend("force", config, user_config)
  end

  vim.cmd("highlight clear")

	-- for colorscheme
	require("darkvoid.colors").setup(config)
	-- for config
	require("darkvoid.config").setup(config)
end

return M
