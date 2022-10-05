local noremap = function(mode, key, map_to)
    vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = false})
end

local noremap_silent = function(mode, key, map_to)
    vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = true})
end

local noremap_func_silent = function(mode, key, func)
    vim.keymap.set(mode, key, func, { silent=true })
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
noremap('n', '<leader>fe', '<cmd>:Telescope find_files<cr>') -- [f]ind[e]xplicit
noremap('n', '<leader>ff', '<cmd>:Telescope git_files<cr>') -- [f]find[f]iles git only
noremap('n', '<leader>fh', '<cmd>:Telescope help_tags<cr>') -- [f]ind[h]elp
noremap('n', '<leader>fs', '<cmd>:Telescope live_grep<cr>') -- [f]ind[s]tring

-- Harpoon
noremap_func_silent('n', '<leader>gg', function() -- Open Harponn UI
    require("harpoon.ui").toggle_quick_menu()
end)
noremap_func_silent('n', '<leader>ga', function() -- Harpoon Mark
    require("harpoon.mark").add_file()
    print("File Marked")
end)
noremap_func_silent('n', '<leader>g1', function() -- Navigate to 1-10 Harpoon Mark
    require("harpoon.ui").nav_file(1)
end)
noremap_func_silent('n', '<leader>g2', function()
    require("harpoon.ui").nav_file(2)
end)
noremap_func_silent('n', '<leader>g3', function()
    require("harpoon.ui").nav_file(3)
end)
noremap_func_silent('n', '<leader>g4', function()
    require("harpoon.ui").nav_file(4)
end)
noremap_func_silent('n', '<leader>g5', function()
    require("harpoon.ui").nav_file(5)
end)
noremap_func_silent('n', '<leader>g6', function()
    require("harpoon.ui").nav_file(6)
end)
noremap_func_silent('n', '<leader>g7', function()
    require("harpoon.ui").nav_file(7)
end)
noremap_func_silent('n', '<leader>g8', function()
    require("harpoon.ui").nav_file(8)
end)
noremap_func_silent('n', '<leader>g9', function()
    require("harpoon.ui").nav_file(9)
end)
noremap_func_silent('n', '<leader>g0', function()
    require("harpoon.ui").nav_file(10)
end)

-- Nvim Tree
noremap('n', '<leader>nf', '<cmd>:NvimTreeFocus<cr>')
noremap('n', '<leader>nn', '<cmd>:NvimTreeToggle<cr>')
noremap('n', '<leader>nb', '<C-w>l<cr>') -- Should be lose focus

-- LSP w/ LSP Saga
noremap_silent("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent=true })
noremap_silent("n", "gr", "<cmd>Lspsaga rename<CR>")
noremap_silent("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
noremap_silent("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")
noremap_silent("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
noremap_silent("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
noremap_silent("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
noremap_func_silent("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
noremap_func_silent("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
noremap_silent("n","<leader>o", "<cmd>LSoutlineToggle<CR>")
noremap_silent("n", "K", "<cmd>Lspsaga hover_doc<CR>")
noremap_silent("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>")
noremap_silent("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>")
noremap_silent("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])

