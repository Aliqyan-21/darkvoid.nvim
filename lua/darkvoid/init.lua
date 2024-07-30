local M = {}

M.setup = function(user_config)
	print("darkvoid setup function called")
	require("darkvoid.colors").setup(user_config)
end

return M
