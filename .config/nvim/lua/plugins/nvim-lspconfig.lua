return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics

    -- Ensure bashls server configuration exists
    opts.servers = opts.servers or {}
    opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
      handlers = {
        ["textDocument/publishDiagnostics"] = function(err, res, ...)
          local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
          -- Check if filename matches any of the patterns: .env, *.env, .env.*, *.env.*
          local is_env_file = file_name == ".env"
            or string.match(file_name, "%.env$")
            or string.match(file_name, "^%.env%.")
            or string.match(file_name, "%.env%.")

          if is_env_file then
            -- For env files, filter out diagnostics but still process the response
            res.diagnostics = {}
          end

          return on_publish_diagnostics(err, res, ...)
        end,
      },
    })
  end,
}
