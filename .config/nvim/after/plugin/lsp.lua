local function showValues(list)
    local output = ""
    for k, v in pairs(list) do
        local value = ""

        if type(v) == "table" then
            value = "table"
        elseif type(v) == "function" then
            value = "function"
        else
            value = tostring(v)
        end
        output = output .. k .. ": " .. value .. "; " .. string.char(10)
    end
    return output
end

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.extend_lspconfig({
    sign_text = false
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'ts_ls', 'rust_analyzer', 'gopls', 'clangd', 'csharp_ls', 'lua_ls', 'basedpyright', 'emmet_language_server', 'cssls', 'css_variables' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

-- lspconfig
local lspconfig = require('lspconfig')
local configs = require("lspconfig.configs")
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local out = showValues(require('mason-lspconfig'))
-- print(out)

lspconfig.clangd.setup {
    cmd = {
        "clangd",
        -- "--fallback-style=webkit"
        -- "-style=file:/home/saeru/.clang-format"
    }
}

lspconfig.pyright.setup {}

lspconfig.cssls.setup {
    capabilities = capabilities
}

configs.blade = {
    default_config = {
        -- Path to the executable: laravel-dev-generators
        cmd = { "~/.local/share/nvim/mason/bin/laravel-dev-tools", "lsp" },
        filetypes = { 'blade' },
        root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
        end,
        settings = {},
    },
}

--[[ lspconfig.blade.setup {
    -- Capabilities is specific to my setup.
    capabilities = capabilities
} ]]

lspconfig.emmet_language_server.setup({
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "php", "blade", "templ" },
    -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
    -- **Note:** only the options listed in the table are supported.
    init_options = {
        ---@type table<string, string>
        includeLanguages = { "php", "templ" },
        --- @type string[]
        excludeLanguages = {},
        --- @type string[]
        extensionsPath = {},
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
        preferences = {},
        --- @type boolean Defaults to `true`
        showAbbreviationSuggestions = true,
        --- @type "always" | "never" Defaults to `"always"`
        showExpandedAbbreviation = "always",
        --- @type boolean Defaults to `false`
        showSuggestionsAsSnippets = false,
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
        syntaxProfiles = {},
        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
        variables = {},
    },
})

-- cmp
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
