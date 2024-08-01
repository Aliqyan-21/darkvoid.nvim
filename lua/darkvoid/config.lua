local M = {}

-- Default configuration
M.config = {}

-- Plugin support loading
local function load_plugins()
	local plugins = {
		"gitsigns",
		"treesitter",
		"nvimtree",
		"telescope",
		-- more plugins can be added here
	}

	for _, plugin in ipairs(plugins) do
		local ok, plugin_config = pcall(require, "darkvoid.plugins." .. plugin)
		if ok then
			plugin_config.setup(M.config.colors)
		else
			print("Failed to load " .. plugin .. " configuration")
		end
	end
end

-- Apply colorscheme
function M.setup(user_config)
	-- Merge user configuration with default (optional)
	M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

	load_plugins()
end

return M
