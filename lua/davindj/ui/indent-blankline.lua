vim.opt.list = true

require("indent_blankline").setup {
    -- ONLY TRIGGER WHEN TREE_SITTER ACTIVE
    show_current_context = true,
    show_current_context_start = false,
}
