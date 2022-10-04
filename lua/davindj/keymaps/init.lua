local noremap = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = false})
end

local noremap_silent = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = true})
end

local keymap = vim.keymap.set

-- LEADER
vim.g.mapleader = ' '

---- VANILA STUFF
-- Disable some unusual behaviour
noremap('n', '<space>', '<nop>') -- disable space moving right
noremap('n', '<bs>', '<nop>') -- disable backspace moving left

-- Real mapping goes here
noremap('i', 'jk', '<esc>') -- escape from insert mode by jk stroke

---- PLUGINS
-- Telescope
noremap('n', '<leader>ff', '<cmd>:Telescope find_files<cr>')
noremap('n', '<leader>fg', '<cmd>:Telescope git_files<cr>')
noremap('n', '<leader>fh', '<cmd>:Telescope help_tags<cr>')

-- Nvim Tree
noremap('n', '<leader>nf', '<cmd>:NvimTreeFocus<cr>')
noremap('n', '<leader>nn', '<cmd>:NvimTreeToggle<cr>')
noremap('n', '<leader>nb', '<C-w>l<cr>') -- Should be lose focus

-- LSP w/ LSP Saga
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

