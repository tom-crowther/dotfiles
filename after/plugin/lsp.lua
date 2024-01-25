require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp = require('lsp-zero').preset({})


lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)



-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


-- Configure python language server for neovim
require('lspconfig').pyright.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", {buffer = 0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {buffer = 0})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {buffer = 0})
        
    end,
}


-- LSP autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),


    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })

})

lsp.setup()


