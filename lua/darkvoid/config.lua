local M = {}

-- Default configuration
M.config = {}

-- Plugin support loading
local function load_plugins(colors)
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
			plugin_config.setup(colors)
		else
			print("Failed to load " .. plugin .. " configuration")
		end
	end
end

-- Apply colorscheme
function M.setup(user_config)
	-- Merge user configuration with default (optional)
	M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

	-- Define colors
	local colors = M.config.colors

	load_plugins(colors)
end

return M
