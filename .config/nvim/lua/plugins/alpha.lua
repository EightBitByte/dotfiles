return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header
    dashboard.section.header.val = {
      " ██████   █████                                ███                 ",
      "▒▒██████ ▒▒███                                ▒▒▒                  ",
      " ▒███▒███ ▒███   ██████   ██████  █████ █████ ████  █████████████  ",
      " ▒███▒▒███▒███  ███▒▒███ ███▒▒███▒▒███ ▒▒███ ▒▒███ ▒▒███▒▒███▒▒███ ",
      " ▒███ ▒▒██████ ▒███████ ▒███ ▒███ ▒███  ▒███  ▒███  ▒███ ▒███ ▒███ ",
      " ▒███  ▒▒█████ ▒███▒▒▒  ▒███ ▒███ ▒▒███ ███   ▒███  ▒███ ▒███ ▒███ ",
      " █████  ▒▒█████▒▒██████ ▒▒██████   ▒▒█████    █████ █████▒███ █████",
      "▒▒▒▒▒    ▒▒▒▒▒  ▒▒▒▒▒▒   ▒▒▒▒▒▒     ▒▒▒▒▒    ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ ",
    }
    dashboard.section.header.opts.hl = "String"

    -- Menu buttons
    local buttons = {
      dashboard.button("f", "  Find file",       "<cmd>lua require('telescope.builtin').find_files()<CR>"),
      dashboard.button("n", "  New file",         "<cmd>ene <BAR> startinsert<CR>"),
      dashboard.button("r", "  Recent files",     "<cmd>lua require('telescope.builtin').oldfiles()<CR>"),
      dashboard.button("g", "  Find text",        "<cmd>lua require('telescope.builtin').live_grep()<CR>"),
      dashboard.button("c", "  Config",           "<cmd>e $MYVIMRC<CR>"),
      dashboard.button("s", "  Restore Session",  "<cmd>lua require('persistence').load()<CR>"),
      dashboard.button("l", "  Lazy",             "<cmd>Lazy<CR>"),
      dashboard.button("q", "  Quit",             "<cmd>qa<CR>"),
    }
    dashboard.section.buttons.val = buttons

    -- Footer: show plugin count
    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return "⚡ Neovim loaded "
        .. stats.loaded
        .. "/"
        .. stats.count
        .. " plugins in "
        .. ms
        .. "ms"
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    -- Layout padding
    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)

    -- Re-render footer after Lazy loads all plugins
    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
