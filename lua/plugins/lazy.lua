local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local plugins = {
    'folke/tokyonight.nvim',
    'goolord/alpha-nvim',
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-tree/nvim-web-devicons' }, -- not strictly required, but recommended
            { 'MunifTanjim/nui.nvim' }
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- measure startuptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
}
local opts = {}
require("lazy").setup({ plugins, opts })
