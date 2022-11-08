local M = { provider = {} }

function M.provider.lsp_progress()
	local Lsp = vim.lsp.util.get_progress_messages()[1]
	return Lsp
			and string.format(
				" %%<%s %s %s (%s%%%%) ",
				((Lsp.percentage or 0) >= 70 and { "", "", "" } or { "", "", "" })[math.floor(
					vim.loop.hrtime() / 12e7
				) % 3 + 1],
				Lsp.title or "",
				Lsp.message or "",
				Lsp.percentage or 0
			)
		or ""
end

function M.provider.lsp_client_names()
	return function()
		local buf_client_names = {}
		for _, client in pairs(vim.lsp.buf_get_clients(0)) do
			table.insert(buf_client_names, client.name)
		end
		return table.concat(buf_client_names, ", ")
	end
end

return M
