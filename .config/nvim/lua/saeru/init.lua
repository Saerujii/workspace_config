require("saeru.remap")
require("saeru.set")

-- For .vim files:
-- augroup BladeFiltypeRelated
--   au BufNewFile,BufRead *.blade.php set ft=blade
-- augroup END

-- vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true})
--
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--     pattern = "*.blade.php",
--     group = "BladeFiltypeRelated",
--     command = "set ft=blade"
-- })

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

vim.g.omni_sql_no_default_maps = 1
