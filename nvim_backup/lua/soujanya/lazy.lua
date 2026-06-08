local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
   "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({    
    -- Colorscheme
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    --
    "nvim-lua/plenary.nvim",
    'eandrju/cellular-automaton.nvim',

    "christoomey/vim-tmux-navigator",
    "szw/vim-maximizer",
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    "numToStr/Comment.nvim",
    "nvim-tree/nvim-tree.lua",
     {'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end},
     "kyazdani42/nvim-web-devicons",
     -- status line
     "nvim-lualine/lualine.nvim",
     -- init.lua:
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "nvim-telescope/telescope.nvim", branch = "0.1.x" },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    

    -- managing & installing lsp servers
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    
    -- configuring lsp servers
    "neonvim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    { "glepnir/lspsaga.nvim", branch = "main" },
    "jose-elias-alvarez/typescript.nvim",
    "onsails/lspkind.nvim",

    -- snippets 
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- formatting and linting
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",

    -- treesitter 
    {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        require("nvim-treesitter.install").update({ with_sync = true})
      end,
    },

    --  autopairs & autotag
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",

   -- git signs 
    "lewis6991/gitsigns.nvim",

  -- indentation lines
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- minimap
    'wfxr/minimap.vim', 
    --

    -- Calendar
    'itchyny/calendar.vim',

    -- satellite
    -- 'lewis6991/satellite.nvim',

    -- rickroll 
    -- 'muratsat/rickroll-nvim',
    
    -- 2048
    {
    "NStefan002/2048.nvim",
    cmd = "Play2048",
    config = true,
    },

    -- cmdline 
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- snake game 
    {
    "Febri-i/snake.nvim",
        dependencies = {
            "Febri-i/fscreen.nvim"
        },
        opts = {}
    },

    'alec-gibson/nvim-tetris',

      {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",

    keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
      { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
      { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
      { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n" },
    },
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = { "scala", "sbt", "java" },
        opts = function()
            local metals_config = require("metals").bare_config()

            metals_config.settings = {
                enableSemanticHighlighting = true,
                showImplicitArguments = true,
                showInferredType = true,
                superMethodLensesEnabled = true,
                showImplicitConversionsAndClasses = true,
            }
            metals_config.init_options.statusBarProvider = "on"
            -- Example if you are using cmp how to make sure the correct capabilities for snippets are set

            metals_config.on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                local signature_setup = {
                    bind = true, -- This is mandatory, otherwise border config won't get registered.
                    handler_opts = {
                        border = "rounded"
                    }
                }
                require("lsp_signature").on_attach(signature_setup, bufnr)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end

            return metals_config
        end,
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = self.ft,
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },


    {
      -- amongst your other plugins
      {'akinsho/toggleterm.nvim', version = "*", config = true}
      -- or
      -- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
    }



})




