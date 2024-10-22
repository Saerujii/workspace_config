vim.opt.termguicolors = true

-- require('nvim-highlight-colors').setup({})

local ccc = require("ccc")
ccc.setup {}

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.css",
    callback = function()
        vim.cmd("CccHighlighterEnable")
    end
})
