return {
  {
    "jackMort/ChatGPT.nvim",
    cmd = {
      "ChatGPT",
      "ChatGPTEditWithInstructions",
      "ChatGPTActAs",
      "ChatGPTRun",
      "ChatGPTCompleteCode"
    },
    update = false,  -- plugin's lua customed for work
    config = function()
      require("chatgpt").setup({
        openai_params = {
          model = "gpt-4o",
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
          max_tokens = 4095,
        }
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    },
  }
}
