return {
  "https://gitlab.com/code-stats/code-stats-vim.git",

  opts = {
    defaults = {
      codestats_api_key = os.getenv("CODESTATS_API_KEY"),
    },
  },
  config = function()
    print("configure codestats plugin")
  end,
}
