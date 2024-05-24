local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window instead of opening one at the side
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
}

-- Install plugins here
return packer.startup(function(use)
    -- add plugins here
    use "wbthomason/packer.nvim"    -- have packer manage itself
    use "nvim-lua/popup.nvim"       -- an implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"     -- useful lua funcitons used by lots of plugins
    use "windwp/nvim-autopairs"     -- autopair brackets, integraters with both cmp and treesitter
    use "windwp/nvim-ts-autotag"    -- autopair html/jsx/tsx tags
    use "akinsho/bufferline.nvim"   -- tabs at top of editor
    use "moll/vim-bbye"             -- hotkey to close buffers/tabs with Shift+Q
    use "nvim-lualine/lualine.nvim" -- styled line at bottom of editor
    use "akinsho/toggleterm.nvim"   -- terminal within neovim
    use "lewis6991/impatient.nvim"  -- speeds up loading lua modules
    use "goolord/alpha-nvim"        -- neovim greeter
    use "ahmedkhalf/project.nvim"   -- project management tool
    use "lukas-reineke/indent-blankline.nvim" -- adds visual guides to indentation

    -- Colorschemes
    -- use "lunarvim/colorschemes"     -- a bunch of color schemes to try out
    use "folke/tokyonight.nvim"
    use "catppuccin/nvim"

    -- Completion plugins
    use "hrsh7th/nvim-cmp"          -- completion plugin
    use "hrsh7th/cmp-buffer"        -- buffer completions
    use "hrsh7th/cmp-path"          -- path completions
    use "hrsh7th/cmp-cmdline"       -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"  -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"      -- lsp completions
    use "hrsh7th/cmp-nvim-lua"      -- lua completions

    -- Snippets
    use "L3MON4D3/LuaSnip"              -- snippet engine
    use "rafamadriz/friendly-snippets"  -- snippets collection for different languages

    -- LSP Plugins
    use "neovim/nvim-lspconfig"             -- enable LSP
    use "williamboman/mason.nvim"           -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- extension to mason.nvim to make it easier to use lspconfig with mason
    use "jose-elias-alvarez/null-ls.nvim"   -- code actions, diagnostics, formatting, completion
    use "RRethy/vim-illuminate"             -- highlighting other uses of word under cursor

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"

    -- Comments
    use "numToStr/Comment.nvim"                         -- easily comment lines
    use "JoosepAlviste/nvim-ts-context-commentstring"   -- provide context for comments in different languages

    -- Git
    use "lewis6991/gitsigns.nvim"   -- git symbols for editor

    -- Tree Explorer
    use "nvim-tree/nvim-web-devicons"   -- file icons for nvim-tree
    use "nvim-tree/nvim-tree.lua"       -- file explorer for neovim

    -- Github Copilot
    use "github/copilot.vim"

    -- Vim be good
    use "ThePrimeagen/vim-be-good"

    -- Automatically setup your configuation after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
