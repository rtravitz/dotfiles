local null_ls = require("null-ls")
local methods = require("null-ls.methods")

local tslint = {
    method = methods.DIAGNOSTICS,
    filetypes = { "typescript", "typescriptreact" },
    generator = null_ls.generator({
        command = "./node_modules/.bin/tslint",
        args = {
          "$FILENAME",
          "--config tslint.json",
          "--project tsconfig.json",
          "--format json",
        },
        to_stdin = true,
        from_stderr = true,
        format = "json",
        on_output = function(params)
        end,
    }),
}

null_ls.register(tslint)
