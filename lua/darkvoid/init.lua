local M = {}

M.setup = function(user_config)
	-- Apply the colorscheme
	require("darkvoid.colors").setup(user_config)

	-- Load plugin configurations
	require("darkvoid.config").setup(user_config)
end

return M
