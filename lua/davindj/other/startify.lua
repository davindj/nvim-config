local options = {
    startify_custom_header = vim.fn["startify#pad"]({
        ' ██     ██            ██     ██',
        '░██    ░██           ░██    ░██',
        '░██    ░██ ███     ██░██    ░██',
        '░██    ░██░░██  █ ░██░██    ░██',
        '░██    ░██ ░██ ███░██░██    ░██',
        '░██    ░██ ░████░████░██    ░██',
        '░░███████  ███░ ░░░██░░███████ ',
        '░░░░░░░  ░░░    ░░░  ░░░░░░░   onii-chan~',
    }),
    startify_lists = {
        { type = "files",     header = { "   Recent Files" } },
        -- { type = "sessions",  header = { "   Sessions    " } }, -- still getin hang of it
        { type = "bookmarks", header = { "   Bookmarks   " } },
    },
    startify_bookmarks = {
        '~/.config/nvim/lua/davindj',
    },
}

-- apply option to vim global variable
for key, value in pairs(options) do
    vim.g[key] = value
end

