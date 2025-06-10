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
        allow_on_markdown = true,
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "plaintex", "latex" },
        callback = function()
          local ok_cmp, cmp = pcall(require, "cmp")
          if ok_cmp then
            cmp.setup.buffer { enabled = true }
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
    config = function()
      require "configs.latex" -- 👈 Load your conceal config
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      require "configs.markdown"
      vim.g.mkdp_browser = "firefox" -- or brave, chromium, etc.
      vim.g.mkdp_markdown_css = "" -- you can style it later if needed
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_preview_options = {
        mkit = {
          mathJax = true,
          katex = true,
        },
        theme = "dark",
      }
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      dir = "~/documents/library", -- 💾 your vault path
      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true },
        },
      },
    },
    init = function()
      require "configs.markdown"
    end,
  },
}
