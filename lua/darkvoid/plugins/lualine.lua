local M = {}

function M.setup(colors, config)
	local enabled = require("darkvoid.colors").config.plugins.lualine

	if not enabled then
		return
	end

	-- Determine common background color and glow effect
	local common_bg = config.transparent and "NONE" or colors.bg
	local glow_fg = config.glow and "bold" or "NONE"

	-- Define the theme for lualine
	local lualine_theme = {
		normal = {
			a = {
				bg = config.transparent and "NONE" or colors.bool,
				fg = config.transparent and colors.added or colors.bg,
			},
			b = { bg = common_bg, fg = colors.bool },
			c = { bg = colors.line_nr, fg = colors.bracket },
			x = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
		},
		insert = {
			a = { bg = common_bg, fg = colors.search_highlight, gui = glow_fg },
			b = { bg = colors.bg, fg = colors.type },
			c = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
			x = { bg = colors.line_nr, fg = colors.bool },
		},
		visual = {
			a = { bg = common_bg, fg = colors.title, gui = glow_fg },
			b = { bg = common_bg, fg = colors.type },
			c = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
			x = { bg = colors.line_nr, fg = colors.bracket },
		},
		replace = {
			a = { bg = common_bg, fg = colors.search_highlight, gui = glow_fg },
			b = { bg = colors.bg, fg = colors.type },
			c = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
			x = { bg = colors.line_nr, fg = colors.bool },
		},
		command = {
			a = { bg = common_bg, fg = colors.search_highlight, gui = glow_fg },
			b = { bg = colors.bg, fg = colors.type },
			c = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
			x = { bg = colors.line_nr, fg = colors.bool },
		},
		inactive = {
			a = { bg = colors.eob, fg = colors.string, gui = glow_fg },
			b = { bg = colors.eob, fg = colors.string },
			c = { bg = colors.eob, fg = colors.string },
		},
	}

	-- Check if lualine is available before setting it up
	local ok, lualine = pcall(require, "lualine")
	if ok then
		lualine.setup({
			options = {
				theme = lualine_theme,
			},
		})
	end
end

return M
