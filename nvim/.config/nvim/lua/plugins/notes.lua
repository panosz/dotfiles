return {
  {
    "obsidian-nvim/obsidian.nvim",
    -- version = "*",  -- recommended, use latest release instead of latest commit
    dependencies = {
      -- optional
      "lukas-reineke/headlines.nvim",
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
      local wk = require("which-key")
      wk.add({
        { "<leader>o", group = "[O]bsidian" },
        { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "[B]acklinks" },
        { "<leader>od", "<cmd>Obsidian dailies<CR>", desc = "[D]aily notes" },
        { "<leader>on", "<cmd>Obsidian new<CR>", desc = "[N]ew note" },
        { "<leader>oo", "<cmd>Obsidian open<CR>", desc = "[O]pen note in obsidian" },
        { "<leader>op", "<cmd>Obsidian paste_img<CR>", desc = "[P]aste image" },
        { "<leader>os", "<cmd>Obsidian search<CR>", desc = "[S]earch in notes" },
        { "<leader>ot", "<cmd>Obsidian tags<CR>", desc = "Search [T]ags" },
        {"<C-Space>", "<cmd>Obsidian toggle_checkbox<cr>", desc = "Toggle checkbox"},
        {
          mode = "v",
          { "<leader>ol", group = "[L]ink" },
          {
            "<leader>oll",
            ":Obsidian link ",
            desc = "[L]ink selection to existing note",
            mode = "v",
            silent = false,
          },
          {
            "<leader>oln",
            ":Obsidian link_new ",
            desc = "Link selection to [N]ew note",
            mode = "v",
            silent = false,
          },
        },
      })
    end,
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "vimwiki",
          path = "~/vimwiki_markdown",
        },
        {
          name = "personal",
          path = "~/obsidian_home",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "notes/dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%d/%m/%Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
      wiki_link_func = "prepend_note_path",

      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local parsed_title = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
         parsed_title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        end

        return require("obsidian").util.zettel_id() .. "-" .. parsed_title
        
      end,

      -- Optional, alternatively you can customize the frontmatter data.
      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        return require("obsidian.builtin").frontmatter(note)
      end,

      -- Optional, for templates (see below).
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },

      open_notes_in = "current",
      -- picker = {
        -- name = nil,
        -- note_mappings = {
          -- new = "<C-x>",
          -- insert_link = "<C-l>",
        -- },
        -- tag_mappings = {
          -- tag_note = "<C-x>",
          -- insert_tag = "<C-l>",
        -- },
      -- },

      ui = {
        enable = false,
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          ["-"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          [" "] = { char = "󰄱", hl_group = "obsidiantodo" },
          ["~"] = { char = "󰰱", hl_group = "obsidiantilde" },
          ["!"] = { char = "", hl_group = "obsidianimportant" },
          [">"] = { char = "", hl_group = "obsidianrightarrow" },
          ["x"] = { char = "", hl_group = "obsidiandone" },
          ["X"] = { char = "", hl_group = "obsidiandone" },
          },
      },

      ---@class obsidian.config.CheckboxOpts
      ---
      ---@field enabled? boolean
      ---
      ---Order of checkbox state chars, e.g. { " ", "x" }
      ---@field order? string[]
      ---
      ---Whether to create new checkbox on paragraphs
      ---@field create_new? boolean
      checkbox = {
        enabled = true,
        create_new = true,
        order = { " ",">","x" },
      },
    },
  },
 { "timantipov/md-table-tidy.nvim",
    -- default config
    opts = {
      padding = 1,        -- number of spaces for cell padding
      key = "<leader>tt", -- key for command :TableTidy<CR>
    }
},

  -- {
    -- 'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    -- -- config = function(_, opts)
      -- -- require("render-markdonw").setup(opts)
    -- -- end,
    -- opts = {
      -- checkbox = {
        -- custom = {
              -- started = { raw = '[>]', rendered = '', highlight = 'DiagnosticWarn' },
        -- },
      -- },
    -- }
-- }
}
