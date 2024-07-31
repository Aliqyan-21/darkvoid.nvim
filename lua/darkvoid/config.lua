local M = {}

-- Default configuration
M.config = {}

-- plugin support loading
local function load_plugins()
	local plugins = {
		"gitsigns",
		"treesitter",
		"nvimtree",
		-- more plugins will be added
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

-- Apply colorscheme
function M.setup(user_config)
	-- user config
	M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

	load_plugins()
end

return M
