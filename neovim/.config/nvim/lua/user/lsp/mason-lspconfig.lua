local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end
mason_lspconfig.setup({
	ensure_installed = { "sumneko_lua", "stylua", "prettierd", "rust-analyzer" },
})
--mason_lspconfig.setup_handlers()
