local api = vim.api

local yankHiGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "lua vim.highlight.on_yank {on_visual=false}",
    group = yankHiGrp
})

local langIndentGrp = api.nvim_create_augroup("LanguageIndentation", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "dart" },
    command = "setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab",
    group = langIndentGrp
})

