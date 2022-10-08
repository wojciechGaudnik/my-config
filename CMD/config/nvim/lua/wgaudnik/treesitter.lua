local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "bash",
    "lua",
    "json",
    "python",
    'bash',
    'c_sharp',
    'cmake',
    'comment',
    'dockerfile',
    'dot',
    'go',
    'graphql',
    'http',
    'java',
    'jsdoc',
    'json',
    'json5',
    'lua',
    'php',
    'regex',
    'swift',
    'scala',
    'scss',
    'vim',
    'vue',
    'yaml',
    'yang'
  },
  ignore_install = { "haskell" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
    disable = { "latex" },
  },
  autotag = { enable = true },
  autoparis = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = { "#E8BA36", "#54A857", "#359FF4", "#5060BB", "#179387" }
    -- , "#8888CC", "#CC88CC" }
    -- colors = {
    --   "#E06C75",
    --   "#E5C07B",
    --   "#98C379",
    --   "#56B6C2",
    --   "#61AFEF",
    --   "#C678DD",
    --   "#E06C75"
    -- },
    -- termcolors = {
    --   "Grey0"
    -- }
  },
  context_commentstring = {
    enable = true,
    config = { javascriptreact = { style_element = "{/*%s*/}" } },
    typescript = "// %s",
    css = "/* %s */",
    scss = "/* %s */",
    html = "<!-- %s -->",
    svelte = "<!-- %s -->",
    vue = "<!-- %s -->",
    json = "",
  },
  indent = {
    enable = true,
    disable = { "" }
  },
    playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
