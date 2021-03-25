require'lspconfig'.gopls.setup{}

  Commands:
  
  Default Values:
    cmd = { "gopls" }
    filetypes = { "go", "gomod" }
    root_dir = root_pattern("go.mod", ".git")
