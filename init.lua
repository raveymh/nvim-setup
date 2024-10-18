vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.g.python3_host_prog = 'C:\\Users\\User\\scoop\\apps\\python310\\current\\python.exe'
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`ini
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.colorcolumn = '+1'
-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.bo.softtabstop = 4

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.pumblend = 10
vim.o.pumheight = 10

vim.o.list = true
vim.o.listchars = 'trail:~,tab:> ,nbsp:␣'
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- NOTE: KEYMAPS
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<Esc><cmd>w<CR>')
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer', noremap = false })
vim.keymap.set('n', '[b', '<cmd>bprev<CR>', { desc = 'Previous buffer', noremap = false })
vim.keymap.set('n', '<C-f>', '/', { noremap = false })

vim.keymap.set({ 'n' }, 's', '<Nop>')
vim.keymap.set('n', 'q', '<Nop>')

-- keep cursor in middle of the screen when C-d and C-u or n N navigating
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz')
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz')

-- keep cursor in middle of the screen when searching
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- Use `opts = {}` to force a plugin to be loaded.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      triggers = {
        { '<auto>', mode = 'ns' },
      },
      win = {
        col = 0.5,
        border = 'rounded',
        padding = { 1, 5 },
      },
      preset = 'helix',
      icons = {
        group = '',
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>b', group = 'Buffer' },
        { '<leader>f', group = 'Telescope' },
        { '<leader>g', group = 'Git' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>l', icon = '', group = 'LSP' },
        { '<leader>c', desc = 'Comment line', icon = '//' },
        { '<leader>fn', desc = 'Neovim config', icon = '⛭' },
        { '<leader>fk', desc = 'Keymaps', icon = '⚿' },
        { "<leader>f'", desc = 'Registers', icon = '[]' },
        { '<leader>e', desc = 'Harpoon menu', icon = '' },
        { '<leader>z', icon = '' },
        { '<leader>u', icon = '⎌' },
        { '<leader>w', proxy = '<c-w>', group = 'Windows' },
        { 'gd', desc = 'Go to Definition', icon = '' },
        { 'gD', desc = 'Go to Declaration', icon = '' },
        { 'go', desc = 'Go to Type Definition', icon = '' },
        { 'gv', desc = 'Last Visual Selection', icon = '~' },
        { 'gz', desc = 'Flash Goto', icon = '🗲 ' },
        { 'gZ', desc = 'Flash Select', icon = '☇' },
        { 'za', desc = 'Fold', icon = '' },
        { 'zA', desc = 'Fold recursively', icon = '' },
        { 'zd', desc = 'Delete fold', icon = '⯇' },
        { 'zD', desc = 'Delete folds recursively', icon = '⯇' },
        { 'zf', desc = 'Make Fold', icon = '⯈' },
        { 'zM', desc = 'Fold all', icon = '⯆' },
        { 'zR', desc = 'Unfold all', icon = '⯅' },
        { 'zx', desc = 'Update folds', icon = '⟳' },
        { 'gg', hidden = true },
        { 'ge', hidden = true },
        { 'gt', hidden = true },
        { 'gT', hidden = true },
        { 'gu', hidden = true },
        { 'gU', hidden = true },
        { 'gw', hidden = true },
        { 'g%', hidden = true },
        { 'g[', hidden = true },
        { 'g]', hidden = true },
        { 'g~', hidden = true },
        { 'zb', hidden = true },
        { 'zc', hidden = true },
        { 'zC', hidden = true },
        { 'ze', hidden = true },
        { 'zH', hidden = true },
        { 'zL', hidden = true },
        { 'zm', hidden = true },
        { 'zo', hidden = true },
        { 'zO', hidden = true },
        { 'zr', hidden = true },
        { 'zt', hidden = true },
        { 'zv', hidden = true },
        { 'zw', hidden = true },
        { 'zz', hidden = true },
        { 'z<CR>', hidden = true },
        { '<leader>h', hidden = true },
        { '<leader>1', hidden = true },
        { '<leader>2', hidden = true },
        { '<leader>3', hidden = true },
        { '<leader>4', hidden = true },
        { '<leader>5', hidden = true },
      },
    },
    vim.keymap.set({ 'n', 'v' }, 'zs', ':%s@', { desc = 'Substitute from all lines' }),
    vim.keymap.set({ 'v', 'x' }, 'zS', ':s@', { desc = 'Substitute from selected lines' }),
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    opts = {},
    config = function()
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          path_display = { 'smart' },
          color_devicons = true,
          layout_strategy = 'vertical',
          layout_config = {
            vertical = {
              height = 0.7,
              width = 0.7,
            },
          },
        },
        pickers = {
          live_grep = {
            theme = 'dropdown',
          },
          current_buffer_fuzzy_find = {
            theme = 'dropdown',
          },
          buffers = {
            theme = 'dropdown',
            previewer = false,
            initial_mode = 'normal',
            mappings = {
              i = {
                ['<C-d>'] = actions.delete_buffer,
              },
              n = {
                ['dd'] = actions.delete_buffer,
              },
            },
          },
          find_files = {
            theme = 'dropdown',
            previewer = false,
          },
          lsp_document_symbols = {
            theme = 'dropdown',
            initial_mode = 'normal',
          },
          lsp_workspace_symbols = {
            theme = 'dropdown',
            initial_mode = 'normal',
          },
          lsp_references = {
            theme = 'dropdown',
            initial_mode = 'normal',
          },
          lsp_definitions = {
            theme = 'dropdown',
            initial_mode = 'normal',
          },
          lsp_declarations = {
            theme = 'dropdown',
            initial_mode = 'normal',
          },
          lsp_implementations = {
            theme = 'dropdown',
            initial_mode = 'normal',
          },
          diagnostics = {
            theme = 'dropdown',
            initial_mode = 'normal',
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Files' })
      vim.keymap.set('n', '<leader>ft', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy find text in buffer' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Grep working directory' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recently opened files' })
      vim.keymap.set('n', '<leader>f<leader>', builtin.buffers, { desc = 'Buffers' })
      vim.keymap.set('n', "<leader>f'", builtin.registers, { desc = 'Registers' })
      -- NOTE: Other <leader> commands
      vim.keymap.set('n', '<leader>z', "<cmd>lua require('zen-mode').toggle({})<CR>", { desc = 'Zenmode' })
      vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
      vim.keymap.set('n', '<leader>c', '<cmd>norm gcc<CR>', { desc = 'Comment line' })
      vim.keymap.set('v', '<leader>c', 'gc', { desc = 'Comment line', remap = true })
      vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#|bd#<CR>', { desc = 'Close all other buffers' })
      vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', '<leader>bc', '<cmd>bd<CR>', { desc = 'Close buffer' })
      -- NOTE: Git
      vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { desc = 'Branches' })
      vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { desc = 'Commits' })
      vim.keymap.set('n', '<leader>gC', '<cmd>Telescope git_bcommits<CR>', { desc = "Current buffer's commits" })
      vim.keymap.set('n', '<leader>gh', '<cmd>Telescope git_stash<CR>', { desc = 'Stash' })
      vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { desc = 'Git Status' })
      -- NOTE: LSP
      vim.keymap.set('n', '<leader>ld', '<cmd>Telescope lsp_definitions<CR>', { desc = 'List definitions' })
      vim.keymap.set('n', '<leader>lD', '<cmd>Telescope lsp_declarations<CR>', { desc = 'List declarations' })
      vim.keymap.set('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>', { desc = 'List document symbols' })
      vim.keymap.set('n', '<leader>lS', '<cmd>Telescope lsp_workspace_symbols<CR>', { desc = 'List workspace symbols' })
      vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references<CR>', { desc = 'List references' })
      vim.keymap.set('n', '<leader>li', '<cmd>Telescope lsp_implementations<CR>', { desc = 'List implementations' })
      vim.keymap.set('n', '<leader>lx', '<cmd>Telescope diagnostics<CR>', { desc = 'Diagnostics' })
      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Config' })
    end,
  },
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' }, dir = '~/.fzf', build = './install --all' },
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`

      -- { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- NOTE: lsp-zero LSP Actions
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Display Hover information' })
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Go to definition' })
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = 'Go to declaration' })
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = 'List implementations under quickfix window' })
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = 'Go to type definition' })
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'List references under quickfix window' })
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename all references' })
          vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code actions' })
        end,
      })

      -- Enable the following language servers
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
      -- Can't add 'gdscript' to servers because it is not listed in Mason. So :MasonInstall gdscript won't work
      local gdscript_config = {
        capabilities = capabilities,
        settings = {},
        filetypes = { 'gd', 'gdscript' },
      }
      if vim.fn.has 'win32' == 1 then
        -- Windows specific. Requires nmap installed (`winget install nmap`)
        gdscript_config['cmd'] = { 'ncat', 'localhost', os.getenv 'GDScript_Port' or '6005' }
      end
      require('lspconfig').gdscript.setup(gdscript_config)
    end,
  },

  { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {
      bind = true,
      floating_window = false,
      floating_window_above_cur_line = false,
      hint_prefix = '•',
      hint_scheme = 'Identifier',
      handler_opts = {
        border = 'rounded',
      },
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,

    vim.keymap.set({ 'n', 'i' }, '<C-k>', function()
      require('lsp_signature').toggle_float_win()
    end, { silent = true, noremap = true, desc = 'Toggle signature' }),
  },

  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    event = 'InsertEnter',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

    opts = {
      keymap = {
        hide = '<Left>',
        show = '<C-space>',
        show_documentation = '<C-b>',
        hide_documentation = '<C-b>',
        scroll_documentation_up = '<C-u>',
        scroll_documentation_down = '<C-d>',
      },
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 1000,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        gdscript = { 'gdformat' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },

  { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path' },

  { -- NOTE: catppuccin colorscheme
    'catppuccin/nvim',
    event = 'VimEnter',
    name = 'catppuccin',
    init = function()
      require('catppuccin').setup {
        flavour = 'auto', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'frappe',
          dark = 'mocha',
        },
        transparent_background = true, -- disables setting the background color.
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = {},
        },
        color_overrides = {
          mocha = {
            base = '#22222e',
            surface1 = '#4e5c68',
            text = '#dae0f7',
            lavender = '#aeb7fe',
            mauve = '#dda6f7',
            blue = '#80c4ff',
          },
        },
        default_integrations = true,
        integrations = {
          aerial = true,
          cmp = true,
          dap = true,
          gitsigns = true,
          indent_blankline = {
            enabled = true,
            scope_color = 'blue',
            colored_indent_levels = true,
          },
          mini = {
            enabled = false,
            indentscope_color = 'blue',
          },
          nvimtree = true,
          treesitter = true,
          telescope = true,
          which_key = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
        custom_highlights = function(colors)
          return {
            TabLineSel = { fg = colors.yellow },
          }
        end,
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { 'folke/trouble.nvim', event = 'VeryLazy' },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    -- stylua: ignore
    keys = {
        { "gz",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "gZ",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  { 'folke/zen-mode.nvim', event = 'VeryLazy' },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 42 }
      require('mini.surround').setup()
      require('mini.indentscope').setup {
        draw = {
          animation = require('mini.indentscope').gen_animation.linear { duration = 50, unit = 'total' },
        },
        options = { try_as_border = true },

        -- Disable for certain filetypes
        vim.api.nvim_create_autocmd({ 'FileType' }, {
          desc = 'Disable indentscope for certain filetypes',
          callback = function()
            local ignore_filetypes = {
              'dashboard',
            }
            if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
              vim.b.miniindentscope_disable = true
            end
          end,
        }),
      }
      -- require('mini.tabline').setup()
      -- vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { link = 'StatusLine' })
      -- vim.api.nvim_set_hl(0, 'MiniTablineVisible', { link = 'StatusLine' })
      -- vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { link = 'TabLineSel' })
      -- vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { link = 'TabLineSel' })
      -- vim.api.nvim_set_hl(0, 'MiniTablineHidden', { link = 'FoldColumn' })

      require('mini.move').setup()
      require('mini.extra').setup()
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'gdscript',
        'godot_resource',
        'gdshader',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'vim',
        'vimdoc',
      },
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn', -- set to `false` to disable one of the mappings
          node_incremental = 'n',
          scope_incremental = 's',
          node_decremental = 'N',
        },
      },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  { 'dstein64/vim-startuptime', event = 'VeryLazy' },

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Enable neovim to be the external editor for Godot, if the cwd has a project.godot file
if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local addr = './godot.pipe'
  if vim.fn.has 'win32' == 1 then
    -- Windows can't pipe so use localhost. Make sure this is configured in Godot
    addr = '127.0.0.1:6004'
  end
  vim.fn.serverstart(addr)
end
