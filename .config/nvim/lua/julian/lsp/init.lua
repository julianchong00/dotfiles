local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "julian.lsp.mason"
require("julian.lsp.handlers").setup()
require "julian.lsp.null-ls"
