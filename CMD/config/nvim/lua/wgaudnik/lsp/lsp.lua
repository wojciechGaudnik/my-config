local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.setup({
    -- ensure_installed = {sumneko_lua, jdtls, pyright, tsserver, ansiblels},
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

--local DEFAULT_SETTINGS = {
--    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" }
--    -- This setting has no relation with the `automatic_installation` setting.
--    ensure_installed = {sumneko_lua, jdtls, pyright},

--    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
--    -- This setting has no relation with the `ensure_installed` setting.
--    -- Can either be:
--    --   - false: Servers are not automatically installed.
--    --   - true: All servers set up via lspconfig are automatically installed.
--    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
--    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
--    automatic_installation = false,

--    ui = {

--        icons = {
--            -- The list icon to use for installed servers.
--            server_installed = "◍",
--            -- The list icon to use for servers that are pending installation.
--            server_pending = "◍",
--            -- The list icon to use for servers that are not installed.
--            server_uninstalled = "◍",
--        },
--        keymaps = {
--            -- Keymap to expand a server in the UI
--            toggle_server_expand = "<CR>",
--            -- Keymap to install the server under the current cursor position
--            install_server = "i",
--            -- Keymap to reinstall/update the server under the current cursor position
--            update_server = "u",
--            -- Keymap to check for new version for the server under the current cursor position
--            check_server_version = "c",
--            -- Keymap to update all installed servers
--            update_all_servers = "U",
--            -- Keymap to check which installed servers are outdated
--            check_outdated_servers = "C",
--            -- Keymap to uninstall a server
--            uninstall_server = "X",
--        },
--    },

--    -- The directory in which to install all servers.
--    -- install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" },

--    pip = {
--        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
--        -- and is not recommended.
--        --
--        -- Example: { "--proxy", "https://proxyserver" }
--        install_args = {},
--    },

--    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
--    -- debugging issues with server installations.
--    log_level = vim.log.levels.INFO,

--    -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
--    -- servers that are requested to be installed will be put in a queue.
--    max_concurrent_installers = 4,
--}

require'lspconfig'.ansiblels.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}


local function blaho()
  print "hello"
end


blaho()



