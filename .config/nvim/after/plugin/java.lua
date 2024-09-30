--[[ local config = {
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls")},
    root_dir = vim.fs.dirname(vim.fs.find({"gradlew", ".git", "mvnw"}, { upward = true})[1]),
}
require("jdtls").start_or_attach(config) ]]

local jdtcfg = {
    settings = {
        java = { signatureHelp = { enabled = true }, contentProvider = { preferred = 'fernflower' } }
    },
    on_init = function(client)
        if client.config.settings then
            client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
    end
}

-- Somehow this is working, but because of mason (Probably) it says double setup or smth 
require("lspconfig").jdtls.setup(jdtcfg)

