require("nvim-tree").setup({
    disable_netrw = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        number = true,
        relativenumber = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})
