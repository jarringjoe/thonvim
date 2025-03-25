return {
    -- 📦 Mason (LSP Package Manager)
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

    -- 🔧 Mason-LSPConfig (Auto-setup LSP servers)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")

            -- 🌍 Global LSP Capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem = {
                documentationFormat = { "markdown", "plaintext" },
                snippetSupport = true,
                preselectSupport = true,
                insertReplaceSupport = true,
                labelDetailsSupport = true,
                deprecatedSupport = true,
                commitCharactersSupport = true,
                tagSupport = { valueSet = { 1 } },
                resolveSupport = {
                    properties = { "documentation", "detail", "additionalTextEdits" },
                },
            }

            -- ✅ Automatically Set Up Installed LSPs
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "pyright", "ruff"}, -- Modify as needed
                automatic_installation = true,
            })

            mason_lspconfig.setup_handlers({
                function(server_name) -- Auto-configure each installed LSP
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        on_attach = function(_, bufnr)
                            local function opts(desc)
                                return { buffer = bufnr, desc = "LSP: " .. desc }
                            end
                            local wk = require("which-key") -- Ensure Which-Key is loaded

                -- 🏷️ Add LSP Keybindings with Which-Key
                wk.add({
                    { "gD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
                    { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
                    { "gi", vim.lsp.buf.implementation, desc = "Go to Implementation" },
                    { "gr", vim.lsp.buf.references, desc = "Show References" },
                    { "<leader>sh", vim.lsp.buf.signature_help, desc = "Show Signature Help" },
                    { "<leader>ra", vim.lsp.buf.rename, desc = "Rename Symbol" },
                    { "<leader>ca",  vim.lsp.buf.code_action, desc = "Code Action" },
                }, { buffer = bufnr })
                        end,
                    })
                end,
            })
        end,
    },

    -- 🛠️ LSPConfig (Handles LSP settings)
    {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
    },
}

