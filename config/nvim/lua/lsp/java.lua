local utils = require('lsp.utils')

local M = {}

local bundles = {
    vim.fn.glob("~/workspace/tools/com.microsoft.java.debug.plugin-*.jar")
}
vim.list_extend(bundles, vim.split(vim.fn.glob("~/workspace/tools/vscode-java-test/server/*.jar"), "\n"))

function M.setup()
	require('jdtls').start_or_attach({
		on_attach = utils.on_attach,
		cmd = {'jdtls-launcher', '/Users/ryantravitz/workspace/cms/.java-projects/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')},
		root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'}),
		init_options = { bundles = bundles }
	})
end

return M
