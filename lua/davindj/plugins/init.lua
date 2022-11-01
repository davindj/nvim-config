-- Auto install packer.nvim if not exists
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Load Pack
vim.cmd("packadd packer.nvim")

-- Packer Plugins
return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'rebelot/kanagawa.nvim' } -- OP colorscheme
    use { 'Shatur/neovim-ayu' } -- colorscheme
    use { 'folke/tokyonight.nvim' } -- MOST POPULAR & Quite dope for transparent bg colorscheme
    use { 'nvim-lualine/lualine.nvim' }
    use { 'kyazdani42/nvim-web-devicons' } -- required for lualine icon DONT FORGET TO INSTALL NERD FONT n Apply to term
    use { 'andweeb/presence.nvim' } -- discord presence lesgoo. downside: disable by remove this plugin
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 
            { 'nvim-lua/plenary.nvim' }, -- Telescope rely on this plugin
        }
    }
    use { -- Best Navigation PLUGIN B)
        'ThePrimeagen/harpoon',
        requires = { 
            { 'nvim-lua/plenary.nvim' }, -- Harpoon rely on this plugin
        }
    }
    use { 'mhinz/vim-startify' } -- vim start screen
    use { 'kyazdani42/nvim-tree.lua' }

    use { -- probably the best Syntax Highlighter tho
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'nvim-treesitter/nvim-treesitter-context' }

    use { 'neovim/nvim-lspconfig' } -- MUST HAVE CONFIG for LSP
    use { 'glepnir/lspsaga.nvim', branch = 'main' } -- GG LSP PLUGIN
    use { 'ray-x/lsp_signature.nvim' }

    use { -- Completer Engine
        'hrsh7th/nvim-cmp',
        requires = { -- auto complete (AC)
            { 'hrsh7th/cmp-nvim-lsp' }, -- AC from LSP
            { 'hrsh7th/cmp-buffer' }, -- AC for each word current buffer
            { 'hrsh7th/cmp-path' }, -- AC for path / file system
            { 'hrsh7th/cmp-cmdline' }, 
            { 'SirVer/ultisnips' }, -- snippet cuz nvim doesnt come with snippet.
            { 'quangnguyen30192/cmp-nvim-ultisnips' },
            -- DONT FORGET TO INSTALL PYNVIM
            -- python3 -m pip install --user --upgrade pynvim
            { 'onsails/lspkind.nvim' }, -- Better UI for Doc n Window CMP
            { 'honza/vim-snippets' },
        }
    }


    -- Auto setup config after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
