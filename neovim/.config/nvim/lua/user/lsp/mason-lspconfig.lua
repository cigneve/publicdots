local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then return end
-- TODO: v2 deprecate nvim-lsp-installer
mason_lspconfig.setup({
      ensure_installed = { "sumneko_lua", "stylua", "prettierd" },
    }
)
--mason_lspconfig.setup_handlers()
