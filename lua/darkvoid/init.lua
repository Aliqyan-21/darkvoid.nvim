local M = {}

M.setup = function(user_config)
	-- for colorscheme
	require("darkvoid.colors").setup(user_config)

	-- for config
	require("darkvoid.config").setup(user_config)
end

return M
