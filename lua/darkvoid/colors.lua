local M = {}

M.config = {
	transparent = false,
	glow = true,
	colors = {
		fg = "#C0C0C0",
		bg = "#1C1C1C",
		cursor = "#FFFF00",
		line_nr = "#404040",
		visual = "#303030",
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
		Comment = { fg = "#585858", gui = "italic" },
		String = { fg = "#A3BE8C" },
		Function = { fg = "#88C0D0" },
		Keyword = { fg = "#BF616A" },
		Identifier = { fg = "#D08770" },
		Type = { fg = "#B48EAD" },
		-- Add more highlight groups as needed
	}

	-- Function to apply glow effect
	local function apply_glow(group_name)
		if M.config.glow then
			vim.cmd(
				"highlight " .. group_name .. " guibg=" .. colors.bg .. " guifg=" .. colors.fg .. " gui=bold,undercurl"
			)
		end
	end

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
		vim.cmd(cmd)

		-- Apply glow effect to important groups
		if M.config.glow and (group_name == "Function" or group_name == "Keyword" or group_name == "Identifier") then
			apply_glow(group_name)
		end
	end
end

return M
