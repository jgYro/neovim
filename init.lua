local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('nvim-telescope/telescope-ui-select.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('simrat39/rust-tools.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('debugloop/telescope-undo.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('phaazon/mind.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('RRethy/vim-illuminate')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('numToStr/Comment.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('kylechui/nvim-surround')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('numToStr/Navigator.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('christoomey/vim-tmux-navigator')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('ThePrimeagen/harpoon')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('ray-x/aurora')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('arjunmahishi/flow.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
-- Plug('gelguy/wilder.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('neovim/nvim-lspconfig')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('ms-jpq/coq_nvim', {branch = 'coq'})
Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})
Plug('ms-jpq/coq.thirdparty', {branch = '3p'})
vim.g.coq_settings = { auto_start = "shut-up" }
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('nvim-treesitter/nvim-treesitter')
Plug('HiPhish/nvim-ts-rainbow2')
Plug('nvim-treesitter/nvim-treesitter-textobjects')

--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('mfussenegger/nvim-dap')
Plug('theHamsta/nvim-dap-virtual-text')
Plug('rcarriga/nvim-dap-ui')
Plug('mfussenegger/nvim-dap-python')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
Plug('phaazon/hop.nvim')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
vim.call('plug#end')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
require'hop'.setup()
require'mind'.setup()
require('Comment').setup()
require("nvim-surround").setup()
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
require('Navigator').setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "vim", "help", "rust", "bash" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require 'ts-rainbow.strategy.global',
    max_file_lines = 3000
  },
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
    textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching and/or pass a list in a "query" key to
        -- group multiple queires.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from
        -- `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They
        -- also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope"
    },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
    },
   },
  },
}

--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
-- local wilder = require('wilder')
-- wilder.setup({modes = {':', '/', '?'}, next_key = "<C-n>", previous_key =
-- "<C-p>"})
-- wilder.set_option('pipeline', {
--   wilder.branch(
--     wilder.cmdline_pipeline({
--       -- sets the language to use, 'vim' and 'python' are supported
--       language = 'vim',
--       -- 0 turns off fuzzy matching
--       -- 1 turns on fuzzy matching
--       -- 2 partial fuzzy matching (match does not have to begin with the same
--       first letter)
--       fuzzy = 1,
--     })
--   ),
-- })
-- wilder.set_option('renderer', wilder.popupmenu_renderer(
--   wilder.popupmenu_palette_theme({
--     -- 'single', 'double', 'rounded' or 'solid'
--     -- can also be a list of 8 characters, see :h
--     wilder#popupmenu_palette_theme() for more details
--     border = 'rounded',
--     max_height = '75%',      -- max height of the palette
--     min_height = 0,          -- set to the same as 'max_height' for a fixed
--     height window
--     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the
--     prompt
--     reverse = 0,             -- set to 1 to reverse the order of the list,
--     use in combination with 'prompt_position'
--   })
-- ))
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
vim.cmd("colorscheme aurora")
vim.g.aurora_transparent = 1
vim.g.aurora_darker = 1
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
require('dap-python').setup('/Library/Frameworks/Python.framework/Versions/3.10/bin/python3')
require("nvim-dap-virtual-text").setup()
require("dapui").setup()
local dap = require('dap')
local dapui = require("dapui")
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
-- Set space as leader
vim.g.mapleader = " "
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.python3_host_prog = "/usr/bin/python3"

-- Hop
vim.keymap.set("n", "<leader><leader>", "<cmd>HopAnywhere<cr>")

-- Telescope
require("telescope").load_extension('harpoon')
require("telescope").load_extension('undo')
require("telescope").load_extension("ui-select")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>h", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>j", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>k", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>l", function() ui.nav_file(4) end)
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope <cr>")
vim.keymap.set("n", "<leader>p", "<cmd>Telescope registers<cr>")
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
vim.keymap.set("i", "<alt>p", "<cmd>Telescope registers<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- Emacs movement in insert mode
vim.keymap.set("i", "<A-p>", "<C-o><cmd>Telescope registers<cr>")
vim.keymap.set("i", "<A-f>", "<C-o>w")
vim.keymap.set("i", "<A-b>", "<C-o>b")
vim.keymap.set("i", "<A-d>", "<C-o>vwhd")
vim.keymap.set("i", "<C-n>", "<down>")
vim.keymap.set("i", "<C-p>", "<up>")
vim.keymap.set("i", "<C-f>", "<right>")
vim.keymap.set("i", "<C-b>", "<left>")
vim.keymap.set('i', '<C-e>', '<End>')
vim.keymap.set('i', '<C-a>', '<Home>')
vim.keymap.set('n', '<C-e>', '<End>')
vim.keymap.set('n', '<C-a>', '<Home>')

-- Move a visually selected group of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center selections and movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Move to other vim windows
vim.keymap.set("n", "<C-h>", "<cmd>NavigatorLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>NavigatorDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>NavigatorUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>NavigatorRight<cr>")

-- Not override value to be pasted after deletction or pasting of previous value
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Native find and replace with cursor
vim.keymap.set("n", "<leader>s",
[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Open terminals
vim.keymap.set('n', '<leader>t', '<cmd>:split<CR><cmd>:term<CR>a')
vim.keymap.set('n', '<leader>y', '<cmd>:vsplit<CR><cmd>:term<CR>a')
vim.keymap.set('t', '<C-n>', '<C-|><C-n>')

--Run Python File (only tested on python)
vim.keymap.set('n', '<leader>rp', '<cmd>FlowRunFile<cr>')

--Run Python selection (only tested on python)
vim.keymap.set('x', '<leader>rs', ':FlowRunSelected<cr>')

-- Copy to system clipboard
vim.keymap.set('x', '<leader>y', '"*y')
--
--
----=====
----/\===
---/  \==
--/    \=
--\    /=
---\  /==
----\/===
----=====
--
--
-- Set line numbers
vim.opt.nu = true

-- Set relative line numbers
vim.opt.relativenumber = true

-- I like how these look
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Formatting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Autoindenting
vim.opt.smartindent = true

-- Disable word wrap
vim.opt.wrap = false

-- No swapfile, set up (plugin) undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable highlighting previous search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Better vim colors

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

-- Decrease updatetime
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- By default split below and to the right for new windows
vim.opt.splitright = true
vim.opt.splitbelow = true
