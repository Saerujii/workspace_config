vim.opt.termguicolors = true

--[[ require('nvim-highlight-colors').setup({
    render = "virtual",
    virtual_symbol = '■',
    virtual_symbol_position = 'inline',

    enable_hex = false,
    enable_short_hex = false,
    enable_rgb = false,
    enable_hsl = false,
    enable_lch = false,

    enable_var_usage = true,
    enable_named_colors = true,
}) ]]

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.css",
    callback = function()
        -- vim.cmd("CccHighlighterEnable")
        vim.keymap.set("n", "P", function() vim.cmd("CccPick") end)

        local ccc = require("ccc")
        ccc.setup {
            highlighter = {
                lsp = false,
                auto_enable = true,
            },
            -- highlight_mode = "foreground",
            highlight_mode = "virtual",
            virtual_symbol = " ■ ",
            inputs = {
                ccc.input.lch,
                ccc.input.hsl,
                ccc.input.rgb,
            },
            outputs = {
                ccc.output.css_lch,
                ccc.output.css_hsl,
                ccc.output.css_rgb,
                ccc.output.hex,
            }
        }
    end,
})
