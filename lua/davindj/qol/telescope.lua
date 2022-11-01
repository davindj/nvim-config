require('telescope').setup{
    defaults = {
        prompt_prefix = '(-0w0)੭ ',
        selection_caret = '➤',
        entry_prefix = '  ',
        borderchars = { "=", "│", "─", "│", "╭", "╮", "╯", "╰" },
        layout_strategy = 'horizontal',
        layout_config = {
            height = 0.9,
            preview_cutoff = 100,
            preview_width = 80,
            prompt_position = "bottom",
            width = 0.8
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}
