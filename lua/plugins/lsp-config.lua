return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "rust_analyzer",
        "cmake",
        "cmake",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      -- lspconfig.rust_analyzer.setup({
      -- 	capabilities = capabilities,
      -- })
      lspconfig.ccls.setup({
        init_options = {
          compilationDatabaseDirectory = "build",
          index = {
            threads = 0,
          },
          clang = {
            excludeArgs = { "-frounding-math" },
          },
        },
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
    end,
    keys = {
      { "K",          vim.lsp.buf.hover,      desc = "LSP hover" },
      { "<leader>gd", vim.lsp.buf.definition, desc = "Jump to definition" },
      { "<leader>gr", vim.lsp.buf.references, desc = "Search for references" },
      -- { "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" }, desc = "LSP code actions" },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set("n", "<leader>a", function()
        vim.cmd.RustLsp("codeAction")
      end, { silent = true, buffer = bufnr, desc = "RustLsp code action" })
    end,
  },
}
