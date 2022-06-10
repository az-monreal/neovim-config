local variables = {
	UltiSnipsSnippetDirectories = { "~/.config/nvim/snippets/UltiSnips" },
}

for k, v in pairs(variables) do
	vim.g[k] = v
end
