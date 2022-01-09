local options = {
-- Spaces and Tabs{{{
    expandtab=true,                                 -- tabs are spaces
    tabstop=4,                                      -- number of visual spaces per TAB
    softtabstop=2,                                  -- number of spaces in tab when editing
    shiftwidth=2,                                   -- when indenting with '>' use two spaces width
    --}}}
--Swap and Backup files{{{
    directory = vim.fn.expand('~/.vim/swp//'),
    backup = false,
    --}}}
-- UI{{{
    number=true,                                    -- show line numbers
    relativenumber=false,                           -- show absolute number only on cursor line
    showcmd=true,                                   -- show command in bottom bar
    showmode=true,                                  -- always show current mode at the bottom
    cursorline=true,                                -- highlight current line
    ruler=true,                                     -- always show cursor position
    updatetime=100,                                 -- Wait time in ms for various operations. Also used by gitgutter.
    omnifunc="syntaxcomplete#Complete",
    wrap=true,
    termguicolors = true,                           -- set term gui colors (most terminals support this)
    linebreak=true,                                 -- wrap lines at convenient points
    wildmenu=true,                                  -- visual autocomplete for command menu
    lazyredraw=true,                                -- redraw only when we need to.
    showmatch=true,                                 -- highlight matching [{()}]
    autoread=true,                                  -- re-read files if modified outside vim
    hidden=true,                                    -- send buffer to the background without writing to disk
    laststatus=2,                                   -- always display status bar
    mouse="a",                                      -- enable mouse for scrolling and resizing
    autochdir=true,                                 -- change the current working directory whenever you open a file, switch buffers, delete a buffer or open/close a window.
    scrolloff=3,                                    -- Minimal number of screen lines to keep above and below the cursor.
    sidescrolloff=5,                                -- The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set.
    history=1000,                                   -- Determine number of entries of ":" commands and previous search patterns that is remembered.
    tags="tags;",                                   -- look for tags recursively in parent directories, (due to ';')
    foldmethod="marker",                            -- Use markers for folding
     --}}}
-- Searching{{{
    incsearch=true,                                 -- search as characters are entered
    ignorecase=true,                                -- ignore case when searching..
    smartcase=true,                                 -- unless you type a capital
    hlsearch=true,                                  -- highlight matches
    --}}}
-- Make :grep use ack {{{
    grepprg="ack --nogroup -- column $*",
    grepformat="%f:%l:%c:%m",
--}}}
   }

   for k, v in pairs(options) do
     vim.opt[k] = v
   end

vim.cmd([[autocmd UIEnter * GuiFont MesloLGS\ NF]]) -- set gui font.

-- vim:foldmethod=marker:foldlevel=0
