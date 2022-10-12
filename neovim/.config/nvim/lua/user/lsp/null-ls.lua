local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup(
  {
    -- Check supported formatters and linters
    sources = {
      -- Set a formatter
      formatting.rufo,
      formatting.prettierd,
      formatting.stylua,
      formatting.black.with { extra_args = { "--fast" } },
      -- Set a linter
      diagnostics.rubocop,
    },
    -- set up null-ls's on_attach function
    on_attach = function(client)
      -- NOTE: You can remove this on attach function to disable format on save
      if client.server_capabilities.document_formatting then
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          pattern = "<buffer>",
          callbacak = vim.lsp.buf.formatting_sync,
          --[[
              vim.lsp.buf.format {
                filter = function(c)
                  -- apply whatever logic you want (in this example, we'll only use null-ls)
                  return c.name == "null-ls"
                end,
                bufnr = bufnr,
              }
            end,
            ]]
        })
      end
    end,
  }
)
