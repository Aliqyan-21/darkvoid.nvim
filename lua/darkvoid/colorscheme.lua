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
		-- Add more color definitions here
	},
}

-- Apply the colorscheme
function M.setup(user_config)
	-- Merge user configuration with default
	M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

	local colors = M.config.colors
	local bg = M.config.transparent and "NONE" or colors.bg

	-- Set up highlight groups
	vim.cmd("highlight Normal guifg=" .. colors.fg .. " guibg=" .. bg)
	vim.cmd("highlight Cursor guifg=" .. colors.cursor .. " guibg=" .. bg)
	vim.cmd("highlight LineNr guifg=" .. colors.line_nr)
	vim.cmd("highlight Visual guibg=" .. colors.visual)

	-- Handle transparency
	if M.config.transparent then
		vim.cmd("hi Normal guibg=NONE")
	end
end

return M
