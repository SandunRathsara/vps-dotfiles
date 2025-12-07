return {
  -- Add the GitHub theme plugin
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      -- Set the colorscheme to 'github_dark_high_contrast'
      colorscheme = "github_dark_high_contrast",
      options = {
        -- You can add other options here if needed (e.g., styles for comments, keywords)
      },
    },
    config = function(_, opts)
      require("github-theme").setup(opts)
      vim.cmd("colorscheme " .. opts.colorscheme)
    end,
  },

  -- Configure LazyVim to use the new colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_default",
    },
  },
}
