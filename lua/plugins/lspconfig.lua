return {
    -- Mason (LSP Package Manager)
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

  -- 2) Mason-LSPConfig v2 (install LSP server binaries)
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ruff" },
        -- automatic_installation and setup_handlers removed in v2; automatic_enable is on by default
      })
    end,
  },


  -- 3) nvim-lspconfig: native LSP configuration via vim.lsp.config()
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = 
      "williamboman/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- Shared capabilities for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport      = true,
        preselectSupport    = true,
        insertReplaceSupport= true,
        labelDetailsSupport = true,
        deprecatedSupport   = true,
        commitCharactersSupport = true,
        tagSupport          = { valueSet = { 1 } },
        resolveSupport      = { properties = { "documentation", "detail", "additionalTextEdits" } },
      }

      -- -- on_attach to map keybindings after LSP attaches to buffer
      -- local function on_attach(_, bufnr)
      --   local wk = require("which-key")
      --   wk.add({
      --       { "gD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
      --       { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
      --       { "gi", vim.lsp.buf.implementation, desc =  "Go to Implementation" },
      --       { "gr", vim.lsp.buf.references, desc = "Show References" },
      --       { "<leader>sh", vim.lsp.buf.signature_help, desc = "Show Signature Help" },
      --       { "<leader>ra", vim.lsp.buf.rename, desc = "Rename Symbol" },
      --       { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
      --   }, { buffer = bufnr })
      -- end

        -- on_attach to map keybindings after LSP attaches to buffer
      local function on_attach(_, bufnr)
        local wk = require("which-key")
        wk.register({
          gD            = { vim.lsp.buf.declaration,    "Go to Declaration"   },
          gd            = { vim.lsp.buf.definition,     "Go to Definition"    },
          gi            = { vim.lsp.buf.implementation, "Go to Implementation"},
          gr            = { vim.lsp.buf.references,     "Show References"     },
          ["<leader>sh"] = { vim.lsp.buf.signature_help, "Show Signature Help"},
          ["<leader>ra"] = { vim.lsp.buf.rename,         "Rename Symbol"       },
          ["<leader>ca"] = { vim.lsp.buf.code_action,    "Code Action"         },
        }, { buffer = bufnr })
      end


      -- 1) Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach    = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim", "require" } },
          },
        },
      })

      -- 2) Python (Pyright)
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach    = on_attach,
        -- Add any pyright-specific settings here
      })

      -- 3) Linting/Formatting (Ruff)
      vim.lsp.config("ruff", {
        capabilities = capabilities,
        on_attach    = on_attach,
        -- Add any ruff-specific settings here
      })
    end,
  }

