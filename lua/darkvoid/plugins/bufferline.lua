local M = {}

function M.setup(colors)
	local bufferline_highlight_groups = {
		BufferLineFill = { bg = "NONE", fg = colors.fg },
		BufferLineBackground = { bg = "NONE", fg = colors.fg },
		BufferLineBufferVisible = { bg = "NONE", fg = colors.fg },
		BufferLineBufferSelected = { bg = "NONE", fg = colors.bufferline_selection, gui = "bold" },
		BufferLineTab = { bg = "NONE", fg = colors.fg },
		BufferLineTabSelected = { bg = "NONE", fg = colors.bg },
		BufferLineTabClose = { bg = "NONE", fg = colors.fg },
		BufferLineSeparator = { bg = "NONE", fg = colors.line_nr },
		BufferLineSeparatorSelected = { bg = colors.bg, fg = colors.bufferline_selection },
		BufferLineIndicatorSelected = { bg = colors.bg, fg = colors.bufferline_selection },
	}

	-- Apply Bufferline highlight groups
	for group_name, config in pairs(bufferline_highlight_groups) do
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
