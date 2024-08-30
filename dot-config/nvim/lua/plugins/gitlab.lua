return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
  },
  enabled = true,
  build = function()
    require("gitlab.server").build(true)
  end, -- Builds the Go binary
  config = function()
    require("gitlab").setup({
      attachment_dir = "/home/nvr/work/tctl/outbox/",
    })
  end,
  keys = {
    {
      "<leader>gmr",
      function()
        require("gitlab").choose_merge_request()
      end,
    },
    {
      "<leader>gmA",
      function()
        require("gitlab").approve()
      end,
    },
    {
      "<leader>gmc",
      function()
        require("gitlab").create_comment()
      end,
    },
    {
      "<leader>gmC",
      function()
        require("gitlab").create_comment_suggestion()
      end,
    },
    {
      "<leader>gmmc",
      function()
        require("gitlab").create_multiline_comment()
      end,
    },
    {
      "<leader>gmd",
      function()
        require("gitlab").toggle_discussions()
      end,
    },
  },
}
