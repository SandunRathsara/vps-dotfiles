return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
      exclude = {
        ".git",
        "node_modules",
      },
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
    explorer = {
      enabled = true,
      git = {
        enabled = true,
        untracked = true,
      },
      exclude = {
        ".git",
        "node_modules",
      },
      files = {
        hidden = true,
        ignored = true,
        ignore_patterns = {
          ".git",
          "node_modules",
        },
      },
    },
  },
}
