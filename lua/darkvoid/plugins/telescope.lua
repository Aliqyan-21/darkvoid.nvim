local M = {}

function M.setup(colors)
	-- Define Telescope highlight groups
	local telescope_highlight_groups = {
		TelescopeNormal = { fg = colors.fg, bg = colors.bg },
		TelescopeBorder = { fg = colors.border, bg = colors.bg },
		TelescopePromptNormal = { fg = colors.pmenu_fg, bg = colors.pmenu_bg },
		TelescopePromptBorder = { fg = colors.border, bg = colors.pmenu_bg },
		TelescopePromptTitle = { fg = colors.title, bg = colors.bg, gui = "bold" },
		TelescopePromptCounter = { fg = colors.cursor, bg = colors.bg },
		TelescopeSelectionCaret = { fg = colors.operator, bg = colors.visual },
		TelescopeSelection = { fg = colors.fg, bg = colors.visual, gui = "bold" },
		TelescopeMatching = { fg = colors.operator, bg = colors.bg, gui = "bold" },
	}

	-- Apply Telescope highlight groups
	for group_name, config in pairs(telescope_highlight_groups) do
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
	end
end

return M
