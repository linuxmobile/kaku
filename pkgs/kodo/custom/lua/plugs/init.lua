require("plugs.strap")
local lazy = require("lazy")
lazy.setup({
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function() require('plugs.ts.treesitter') end
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    lazy = true
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'CursorHold',
    config = function() require('plugs.ui.colorizer') end,
    lazy = true
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = 'CursorHold',
    config = function() require('plugs.ui.devicons') end,
    lazy = true,
  },

  {
    'kyazdani42/nvim-tree.lua',
    event = "VeryLazy",
    cmd = "NvimTreeToggle",
    config = function() require('plugs.util.nvim-tree') end
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", ' ', "'", "`" },
    event = "VeryLazy",
    config = function() require('plugs.util.which-key') end
  },
  {
    'nvim-lua/plenary.nvim',
    event = "VeryLazy",
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    event = "VeryLazy",
    dependencies = { 'plenary.nvim' },
    config = function() require('plugs.util.telescope') end
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function() require('plugs.util.toggleterm') end,
    cmd = "ToggleTerm",
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = 'CursorHold',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsDeleteLn' },
        },
      }
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    config = function() require('plugs.ui.indentlines') end,
    event = 'CursorHold',
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    cmd = {
      "MasonInstall",
      "MasonInstallAll",
      "MasonUninstall",
      "Mason",
      "MasonUninstallAll",
      "MasonLog",
    },
    config = function() require('plugs.lsp.mason') end,
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function() require('Comment').setup() end,
    event = 'CursorHold',
  },
  -- The funs begins
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "CursorHold" },
    event = "VeryLazy",
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
    dependencies = {
      {
        "folke/neodev.nvim",
        "williamboman/mason-lspconfig.nvim"
      },
    },
    config = function()
      require "plugs.lsp.lspconfig"
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    event = "VeryLazy",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        lazy = true,
        config = function()
          require("plugs.lsp.luasnip")
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        event = "InsertEnter",
        lazy = true,
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    config = function()
      require("plugs.lsp.cmp")
    end,
  },
  {
    "LnL7/vim-nix",
    event = "VeryLazy",
    ft = 'nix',
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
  },
  {
    'kevinhwang91/nvim-ufo',
    event = "VeryLazy",
    event = 'CursorHold',
    dependencies = 'kevinhwang91/promise-async'
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = "SymbolsOutline",
    event = "VeryLazy",
    config = function() require("plugs.util.symbols") end
  },
  -- {
  --   'code-biscuits/nvim-biscuits',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   lazy = true,
  --   config = function() require("plugs.lsp.biscuits") end,
  --   event = 'CursorHold',
  --   cmd = 'TSUpdate',
  -- },
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function() require("plugs.util.grapple") end,
    cmd = {
      "GrappleCycle",
      "GrapplePopup",
      "GrappleReset",
      "GrappleSelect",
      "GrappleTag",
      "GrappleTags",
      "GrappleToggle",
      "GrappleUntag"
    }
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    event = "VeryLazy",
    cmd = {
      "HopAnywhere",
      "HopChar1",
      "HopChar2",
      "HopLine",
      "HopLineStart",
      "HopVertical",
      "HopWord"
    },
    config = function() require("plugs.util.hop") end
  },
  {
    "goolord/alpha-nvim",
    event = "VeryLazy",
    cmd = {
      "Alpha",
      "AlphaRedraw"
    },
    config = function()
      require("plugs.ui.alpha")
    end
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function() require("plugs.lsp.saga") end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  {
    "onsails/lspkind.nvim",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require ("plugs.util.copilot")
    end,
  },
  {
    "andweeb/presence.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require ("plugs.util.presence")
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    ft = { "markdown", "lua", "javascript", "typescript", "typescriptreact", "javascriptreact", "html", "css", "astro" },
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        twilight = { enabled = true },
        gitsigns = { enabled = false },
      },
    },
    dependencies = {
      {
        "folke/twilight.nvim",
        event = "VeryLazy",
        -- ft = { "markdown", "lua", "javascript", "typescript", "typescriptreact", "javascriptreact", "html", "css", "astro" },
        treesitter = true,
        dimming = {
          alpha = 0.25,
        },
      },
    },
  },
})
