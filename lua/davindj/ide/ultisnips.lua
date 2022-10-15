local options = {
  UltiSnipsExpandTrigger = "<M-CR>",
  UltiSnipsJumpForwardTrigger= "<M-CR>",
  UltiSnipsJumpBackwardTrigger = "<M-BS>",
  UltiSnipsListSnippets = "<C-?>",
  UltiSnipsEditSplit = "vertical",
}

for opt,val in pairs(options) do
	vim.g[opt] = val
end

