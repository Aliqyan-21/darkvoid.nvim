-- lua/darkvoid/colors.lua
local M = {}

-- Default configuration
M.config = {
	transparent = false,
	colors = {
		fg = "#C0C0C0",
		bg = "#1C1C1C",
		cursor = "#FFFF00",
		line_nr = "#404040",
		visual = "#444444",
	},
}

-- Apply the colorscheme (using defined colors and groups)
function M.setup(user_config)
	-- Merge user configuration with default (optional)
	M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

	-- Define colors and highlight groups (using updated config)
	local colors = M.config.colors

	local highlight_groups = {
		Normal = { fg = colors.fg, bg = M.config.transparent and "NONE" or colors.bg },
		Cursor = { fg = colors.cursor, bg = M.config.transparent and "NONE" or colors.bg },
		LineNr = { fg = colors.line_nr },
		Visual = { bg = colors.visual },
		-- Extended highlight groups
		Comment = { fg = "#888888", gui = "italic" },
		String = { fg = "#A3BE8C" },
		Function = { fg = "#88C0D0" },
		Keyword = { fg = "#BF616A" },
		Identifier = { fg = "#D08770" },
		Type = { fg = "#B48EAD" },
		-- Add more highlight groups as needed
	}

	-- Apply highlight groups
	for group_name, config in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		if config.fg then
			cmd = cmd .. " guifg=" .. config.fg
		end
		if config.bg then
			cmd = cmd .. " guibg=" .. config.bg
		end
		if config.gui then
			cmd = cmd .. " gui=" .. config.gui
		end
		print("Executing command:", cmd)
		vim.cmd(cmd)
	end
end

return M
