
return function (on_attach, capabilities)
  require("lspconfig").pyright.setup({
    on_attach=on_attach,
    capabilities=capabilities,
    filetypes={ "python" },
  })
end
