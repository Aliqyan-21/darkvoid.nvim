local M = {}

function M.setup()
	vim.cmd("highlight! link TSFunction Function")
	vim.cmd("highlight! link TSKeyword Keyword")
	vim.cmd("highlight! link TSString String")
	vim.cmd("highlight! link TSVariable Identifier")
	vim.cmd("highlight! link TSType Type")
end

return M
