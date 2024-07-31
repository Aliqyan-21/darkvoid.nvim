local M = {}

-- Default configuration
M.config = {}

-- Load plugin support
local function load_plugins()
	local plugins = {
		"gitsigns",
		"treesitter",
		"nvimtree",
		-- Add more plugins here as needed
	}

	for _, plugin in ipairs(plugins) do
		local ok, plugin_config = pcall(require, "darkvoid.plugins." .. plugin)
		if ok then
			plugin_config.setup()
		else
			print("Failed to load " .. plugin .. " configuration")
		end
	end
end

-- Apply the colorscheme
function M.setup(user_config)
	-- Load user configuration
	M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

	-- Load plugin configurations
	load_plugins()
end

return M
