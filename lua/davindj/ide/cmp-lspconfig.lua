---- CMP CONFIGURATION
local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),   -- better UI imo
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    cmd_line = "[cmd_line]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    path = "[Path]",
                    ultisnips = "[Snippet]",
                })[entry.source.name]
                return vim_item
            end
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'nvim_lsp' }, -- Completion from LSP
    },{ -- Seperate Buffer (LAST RESORT)
        { name = 'buffer' },
    }),
    preselect = cmp.PreselectMode.None, -- make sure select 1st element in AutoComplete. one of GO bug
    experimental = {
        ghost_text = true, 
    }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    })
})

-- Export CMP Module
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities()

---- SETUP LSP
local on_attach = function(client, bufnr)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<space>F', vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
    debounce_text_changes = 150,
}

require('lspconfig')['gopls'].setup{ -- GO
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['pyright'].setup{ -- Python
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['sourcekit'].setup{ -- SWIFT
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['tsserver'].setup{ -- JS & TS
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

