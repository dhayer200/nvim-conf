return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
        "c",
        "python",
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
        "ruff",
        "mypy",
        "clang-format",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason.nvim", "nvim-dap" },
    opts = {
      ensure_installed = { "python", "codelldb" },
      handlers = {},
    },
  },

  {
    "linux-cultist/venv-selector.nvim",
    event = "VeryLazy",
    opts = {
      search_venv_managers = true,
      search_workspace = true,
      stay_on_this_version = true,
      name = ".venv",
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "iurimateus/luasnip-latex-snippets.nvim",
      "lervag/vimtex",
    },
    config = function()
      require("luasnip").config.set_config {
        enable_autosnippets = true,
      }

      require("luasnip.loaders.from_lua").lazy_load { paths = "~/.config/nvim/lua/snippets/" }
      require("luasnip.loaders.from_vscode").lazy_load { exclude = { "tex", "latex", "plaintex" } }

      require("luasnip-latex-snippets").setup {
        use_treesitter = false,
        allow_on_markdown = false,
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "plaintex", "latex" },
        callback = function()
          local ok_cmp, cmp = pcall(require, "cmp")
          if ok_cmp then
            cmp.setup.buffer { enabled = false }
          end

          vim.opt.spell = true
          vim.opt.spelllang = "en_us"
        end,
      })
    end,
    ft = { "tex", "plaintex", "latex" },
  },

  {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "latex" },
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
}
