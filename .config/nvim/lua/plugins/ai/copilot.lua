return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      {
        "copilotlsp-nvim/copilot-lsp",
      }
    },
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
    after = { "copilot.lua" },
  }
}
