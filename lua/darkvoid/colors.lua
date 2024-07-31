local M = {}

-- Default configuration
M.config = {
	transparent = false,
	glow = false, -- Add glow option
	colors = {
		fg = "#C0C0C0",
		bg = "#1C1C1C",
		cursor = "#FFFF00",
		line_nr = "#404040",
		visual = "#303030",
		comment = "#585858",
		string = "#D1D1D1", -- More monochromatic
		func = "#E1E1E1", -- Renamed from 'function' to 'func'
		kw = "#F1F1F1", -- Renamed from 'keyword' to 'kw'
		identifier = "#B1B1B1",
		type = "#A1A1A1",
		search_highlight = "#1bfd9c",
		operator = "#1bfd9c",
		bracket = "#E6E6E6",
		-- gitsigns colors
		added = "#baffc9",
		changed = "#ffffba",
		removed = "#ffb3ba",
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
		Comment = { fg = colors.comment, gui = "italic" },
		String = { fg = colors.string },
		Function = { fg = colors.func },
		Keyword = { fg = colors.kw },
		Identifier = { fg = colors.identifier },
		Type = { fg = colors.type },
		-- Add specific highlight groups
		Search = { fg = colors.search_highlight, bg = colors.bg, gui = "bold" },
		IncSearch = { fg = colors.search_highlight, bg = colors.bg, gui = "bold" },
		Operator = { fg = colors.operator },
		Delimiter = { fg = colors.bracket }, -- Add bracket highlight group
		-- Add more highlight groups as needed
	}

	-- Function to apply glow effect
	local function apply_glow(group_name, config)
		if M.config.glow then
			vim.cmd(
				"highlight " .. group_name .. " guifg=" .. config.fg .. " gui=bold,undercurl guisp=" .. colors.operator
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
		if
			M.config.glow
			and (
				group_name == "Function"
				or group_name == "Keyword"
				or group_name == "Identifier"
				or group_name == "Operator"
			)
		then
			apply_glow(group_name, config)
		end
	end
end

return M
