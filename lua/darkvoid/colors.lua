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
		color_column = "#333333",
		comment = "#888888",
		conceal = "#F0E0A1",
		cursor_column = "#333333",
		cursor_line = "#333333",
		diff_add = "#00FF00",
		diff_change = "#FFFFFF",
		diff_delete = "#FF0000",
		diff_text = "#00FFFF",
		error_msg = "#FFFFFF",
		fold_column = "#888888",
		folded = "#C0C0C0",
		inc_search = "#FFFF00",
		match_paren = "#E1E1E1",
		more_msg = "#C0C0C0",
		non_text = "#888888",
		pmenu = "#C0C0C0",
		pmenu_sel = "#C0C0C0",
		question = "#FF0000",
		quick_fix_line = "#FF0000",
		search = "#C0C0C0",
		sign_column = "#1C1C1C",
		status_line = "#C0C0C0",
		status_line_nc = "#888888",
		status_line_term = "#000000",
		tab_line = "#888888",
		tab_line_fill = "#C0C0C0",
		tab_line_sel = "#C0C0C0",
		title = "#C0C0C0",
		todo = "#FFFFFF",
		underlined = "#C0C0C0",
		vert_split = "#1C1C1C",
		warning_msg = "#000000",
		wild_menu = "#C0C0C0",
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
		ColorColumn = { bg = colors.color_column },
		Comment = { fg = colors.comment, gui = "italic" },
		Conceal = { fg = colors.conceal, gui = "italic" },
		CursorColumn = { bg = colors.cursor_column },
		CursorLine = { bg = colors.cursor_line },
		DiffAdd = { fg = colors.diff_add },
		DiffChange = { fg = colors.diff_change },
		DiffDelete = { fg = colors.diff_delete },
		DiffText = { fg = colors.diff_text },
		ErrorMsg = { fg = colors.error_msg, bg = "red" },
		FoldColumn = { fg = colors.fold_column },
		Folded = { fg = colors.folded, gui = "italic" },
		IncSearch = { fg = colors.inc_search, bg = "yellow" },
		MatchParen = { fg = colors.match_paren, bg = colors.bg },
		MoreMsg = { fg = colors.more_msg, gui = "bold" },
		NonText = { fg = colors.non_text },
		Pmenu = { fg = colors.pmenu, bg = colors.bg },
		PmenuSel = { fg = colors.pmenu_sel, bg = colors.bg },
		Question = { fg = colors.question },
		QuickFixLine = { fg = colors.quick_fix_line, gui = "underline" },
		Search = { fg = colors.search, bg = "yellow" },
		SignColumn = { fg = colors.sign_column },
		StatusLine = { fg = colors.status_line, bg = colors.bg },
		StatusLineNC = { fg = colors.status_line_nc, bg = colors.bg },
		StatusLineTerm = { fg = colors.status_line_term },
		TabLine = { fg = colors.tab_line },
		TabLineFill = { fg = colors.tab_line_fill },
		TabLineSel = { fg = colors.tab_line_sel },
		Title = { fg = colors.title, gui = "bold" },
		Todo = { fg = colors.todo, gui = "bold,underline" },
		Underlined = { fg = colors.underlined, gui = "underline" },
		VertSplit = { fg = colors.vert_split },
		WarningMsg = { fg = colors.warning_msg, bg = "yellow" },
		WildMenu = { fg = colors.wild_menu },
	}

	local link_groups = {
		Constant = "Normal",
		Identifier = "Normal",
		Statement = "Normal",
		PreProc = "Normal",
		Type = "Normal",
		Special = "Normal",
		ModeMsg = "MoreMsg",
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
		vim.cmd(cmd)
	end

	-- Apply link groups
	for group_name, link_to in pairs(link_groups) do
		vim.cmd("highlight link " .. group_name .. " " .. link_to)
	end
end

return M
