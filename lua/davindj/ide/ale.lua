vim.g.ale_fixers = {
    ['*'] = { 'remove_trailing_lines', 'trim_whitespace', },
    ['javascript'] = { 'eslint', 'prettier' }
}

