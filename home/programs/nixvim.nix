{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    # ── Themeing ────────────────────────────────────────────────────────────────
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = false;
        integrations = {
          treesitter = true;
          telescope.enabled = true;
          blink_cmp = true;
          mini.enabled = true;
          lsp_trouble = true;
          gitsigns = true;
          native_lsp = {
            enabled = true;
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              warnings = [ "underline" ];
              information = [ "underline" ];
            };
          };
        };
      };
    };

    # ── Packages Install ────────────────────────────────────────────────────────────────
    extraPackages = with pkgs; [
      nixd
      nixfmt
      statix
      lua-language-server
      pyright
      stylua
      black
      isort
      pylint
      luajitPackages.luacheck
    ];

    # ── Leader ────────────────────────────────────────────────────────────────
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # ── Options ───────────────────────────────────────────────────────────────
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      termguicolors = true;
      signcolumn = "yes";
      scrolloff = 8;
      sidescrolloff = 8;
      winborder = "rounded";
      wrap = false;
      splitright = true;
      splitbelow = true;
      mouse = "a";
      backup = false;
      writebackup = false;
      swapfile = false;
      undofile = true;
      timeoutlen = 500;
      updatetime = 300;
      hidden = true;
      autochdir = true;
    };

    # ── Keymaps ───────────────────────────────────────────────────────────────
    keymaps = [
      {
        mode = "i";
        key = "jk";
        action = "<Esc>";
        options = {
          noremap = true;
          silent = true;
        };
      }

      # Clipboard
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>y";
        action = ''"+y'';
        options = {
          desc = "Yank to clipboard";
        };
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = ''"+Y'';
        options = {
          desc = "Yank line to clipboard";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>p";
        action = ''"+p'';
        options = {
          desc = "Paste from clipboard";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>P";
        action = ''"+P'';
        options = {
          desc = "Paste before from clipboard";
        };
      }

      # Move lines
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          silent = true;
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
      }

      {
        mode = "n";
        key = "<leader>so";
        action = ":update<CR>:source<CR>";
        options = {
          desc = "Source file";
        };
      }

      # Window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          noremap = true;
          silent = true;
        };
      }

      # Buffers
      {
        mode = "n";
        key = "<leader>bn";
        action = ":bnext<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Next buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>bp";
        action = ":bprevious<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Prev buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = ":bd<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Delete buffer";
        };
      }

      {
        mode = "n";
        key = "<leader>nf";
        action.__raw = "vim.lsp.buf.format";
        options = {
          desc = "Format file";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Oil<CR>";
        options = {
          silent = true;
          desc = "Open Oil";
        };
      }
      {
        mode = "n";
        key = "<leader>ws";
        action = ":w suda://%<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Write with sudo";
        };
      }

      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "s";
        action.__raw = "function() require('flash').jump() end";
        options = {
          desc = "Flash jump";
        };
      }

      # Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action.__raw = "function() require('telescope.builtin').find_files() end";
        options = {
          desc = "Find files";
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action.__raw = "function() require('telescope.builtin').live_grep({ hidden = true, search_dirs = { vim.loop.cwd() } }) end";
        options = {
          desc = "Live grep";
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action.__raw = "function() require('telescope.builtin').buffers() end";
        options = {
          desc = "Buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>fh";
        action.__raw = "function() require('telescope.builtin').find_files({ hidden = true, cwd = '/' }) end";
        options = {
          desc = "Find hidden files";
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action.__raw = "function() require('telescope.builtin').find_files({ hidden = true, cwd = '/' }) end";
        options = {
          desc = "Find from root";
        };
      }
      {
        mode = "n";
        key = "<leader>fd";
        action.__raw = "function() require('telescope.builtin').find_files({ hidden = true, cwd = '~/.config/' }) end";
        options = {
          desc = "Find dotfiles";
        };
      }
      {
        mode = "n";
        key = "<leader>fv";
        action.__raw = "function() require('telescope.builtin').find_files({ hidden = true, cwd = '~/.config/nvim' }) end";
        options = {
          desc = "Find nvim dots";
        };
      }
      {
        mode = "n";
        key = "<leader>fc";
        action.__raw = "function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h'), hidden = true }) end";
        options = {
          noremap = true;
          silent = true;
          desc = "Find in current dir";
        };
      }
      {
        mode = "n";
        key = "<leader>fo";
        action.__raw = "function() require('telescope.builtin').oldfiles() end";
        options = {
          desc = "Recent files";
        };
      }

      # harpoon
      {
        mode = "n";
        key = "<leader>a";
        action.__raw = "function() require('harpoon'):list():add() end";
        options = {
          desc = "Harpoon add file";
        };
      }
      {
        mode = "n";
        key = "<leader>h";
        action.__raw = "function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end";
        options = {
          desc = "Harpoon menu";
        };
      }
      {
        mode = "n";
        key = "<leader>1";
        action.__raw = "function() require('harpoon'):list():select(1) end";
        options = {
          desc = "Harpoon file 1";
        };
      }
      {
        mode = "n";
        key = "<leader>2";
        action.__raw = "function() require('harpoon'):list():select(2) end";
        options = {
          desc = "Harpoon file 2";
        };
      }
      {
        mode = "n";
        key = "<leader>3";
        action.__raw = "function() require('harpoon'):list():select(3) end";
        options = {
          desc = "Harpoon file 3";
        };
      }
      {
        mode = "n";
        key = "<leader>4";
        action.__raw = "function() require('harpoon'):list():select(4) end";
        options = {
          desc = "Harpoon file 4";
        };
      }

      # Trouble
      {
        mode = "n";
        key = "<leader>xx";
        action = ":Trouble diagnostics toggle<CR>";
        options = {
          silent = true;
          desc = "Diagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>xb";
        action = ":Trouble diagnostics toggle filter.buf=0<CR>";
        options = {
          silent = true;
          desc = "Buffer diagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>xl";
        action = ":Trouble loclist toggle<CR>";
        options = {
          silent = true;
          desc = "Location list";
        };
      }
      {
        mode = "n";
        key = "<leader>xq";
        action = ":Trouble qflist toggle<CR>";
        options = {
          silent = true;
          desc = "Quickfix list";
        };
      }

      # Git
      {
        mode = "n";
        key = "<leader>gs";
        action = ":Git<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Git status";
        };
      }
      {
        mode = "n";
        key = "<leader>gc";
        action = ":Git commit<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Git commit";
        };
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = ":Git push<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Git push";
        };
      }
      {
        mode = "n";
        key = "<leader>ga";
        action = ":Git add --all<CR>";
        options = {
          noremap = true;
          silent = true;
          desc = "Git add all";
        };
      }
    ];

    # ── Plugins ───────────────────────────────────────────────────────────────
    plugins = {

      web-devicons.enable = true;

      lualine = {
        enable = true;
        settings = {
          options = {
            globalstatus = true;
            component_separators = {
              left = "";
              right = "";
            };
            section_separators = {
              left = "";
              right = "";
            };
          };
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [
              "branch"
              "diff"
              "diagnostics"
            ];
            lualine_c = [ "filename" ];
            lualine_x = [
              "encoding"
              "fileformat"
              "filetype"
            ];
            lualine_y = [ "progress" ];
            lualine_z = [ "location" ];
          };
        };
      };

      noice = {
        enable = true;
        settings = {
          lsp.override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            inc_rename = false;
          };
        };
      };

      render-markdown.enable = true;

      notify.enable = true;

      fidget = {
        enable = true;
        settings.notification.window.winblend = 0;
      };

      trouble = {
        enable = true;
        settings.auto_close = true;
      };

      smear-cursor = {
        enable = true;
        settings.smear_between_neighbor_lines = true;
      };

      mini = {
        enable = true;
        modules.indentscope = {
          symbol = "│";
          options = {
            try_as_border = true;
          };
        };
      };

      nvim-colorizer = {
        enable = true;
        settings.user_default_options = {
          css = true;
          html = true;
          names = false;
        };
      };

      rainbow-delimiters.enable = true;
      vim-cool.enable = true;

      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [
            "c"
            "cpp"
            "fish"
            "go"
            "html"
            "java"
            "json"
            "nix"
            "xml"
            "typescript"
            "lua"
            "vim"
            "markdown"
            "python"
            "javascript"
          ];
          sync_install = false;
          auto_install = true;
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = false;
          };
          indent.enable = true;
        };
      };

      nvim-autopairs = {
        enable = true;
        settings.check_ts = true;
      };

      comment = {
        enable = true;
        settings = {
          toggler = {
            line = "gcc";
            block = "gbc";
          };
          opleader = {
            line = "gc";
            block = "gb";
          };
          extra = {
            above = "gcO";
            below = "gco";
            eol = "gcA";
          };
        };
      };

      luasnip = {
        enable = true;
        fromVscode = [ { } ];
      };
      friendly-snippets.enable = true;

      blink-cmp = {
        enable = true;
        settings = {
          fuzzy.implementation = "lua";
          signature.enabled = true;
          sources.default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          completion = {
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
            };
            menu = {
              auto_show = true;
              draw = {
                treesitter = [ "lsp" ];
                columns = [
                  {
                    "__unkeyed-1" = "kind_icon";
                    "__unkeyed-2" = "label";
                    "__unkeyed-3" = "label_description";
                    gap = 1;
                  }
                  { "__unkeyed-1" = "kind"; }
                ];
              };
            };
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          pyright.enable = true;
          lua_ls = {
            enable = true;
            settings.Lua = {
              diagnostics.globals = [ "vim" ];
              completion.callSnippet = "Replace";
            };
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            lua = [ "stylua" ];
            python = [
              "black"
              "isort"
            ];
          };
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          python = [ "pylint" ];
          lua = [ "luacheck" ];
          nix = [ "statix" ];
        };
        autoCmd.event = [ "BufWritePost" ];
      };

      telescope = {
        enable = true;
        settings = {
          defaults.file_ignore_patterns = [
            "^.git/"
            "node_modules/"
            "dist/"
            "build/"
            "/home/kush/go/"
          ];
          pickers.buffers.mappings = {
            i = {
              "<c-d>" = "delete_buffer";
            };
            n = {
              "<c-d>" = "delete_buffer";
            };
          };
        };
        extensions.ui-select = {
          enable = true;
          settings.__raw = ''require("telescope.themes").get_dropdown({})'';
        };
      };

      flash.enable = true;

      oil = {
        enable = true;
        settings.keymaps = {
          "g?" = {
            "__unkeyed-1" = "actions.show_help";
            mode = "n";
          };
          "<CR>" = "actions.select";
          "<C-s>" = {
            "__unkeyed-1" = "actions.select";
            opts = {
              vertical = true;
            };
          };
          "<C-h>" = {
            "__unkeyed-1" = "actions.select";
            opts = {
              horizontal = true;
            };
          };
          "<C-p>" = "actions.preview";
          "<C-c>" = {
            "__unkeyed-1" = "actions.close";
            mode = "n";
          };
          "<C-l>" = "actions.refresh";
          "-" = {
            "__unkeyed-1" = "actions.parent";
            mode = "n";
          };
          "_" = {
            "__unkeyed-1" = "actions.open_cwd";
            mode = "n";
          };
          "`" = {
            "__unkeyed-1" = "actions.cd";
            mode = "n";
          };
          "~" = {
            "__unkeyed-1" = "actions.cd";
            opts = {
              scope = "tab";
            };
            mode = "n";
          };
          "gs" = {
            "__unkeyed-1" = "actions.change_sort";
            mode = "n";
          };
          "gx" = "actions.open_external";
          "<C-t>" = {
            "__unkeyed-1" = "actions.toggle_hidden";
            mode = "n";
          };
          "g\\" = {
            "__unkeyed-1" = "actions.toggle_trash";
            mode = "n";
          };
        };
      };

      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add = {
              text = "│";
            };
            change = {
              text = "│";
            };
            delete = {
              text = "_";
            };
            topdelete = {
              text = "‾";
            };
            changedelete = {
              text = "~";
            };
            untracked = {
              text = "┆";
            };
          };
          current_line_blame = true;
          current_line_blame_opts.delay = 500;
        };
      };

      fugitive.enable = true;
      plenary.enable = true;
    };

    # ── Extra plugins (no nixvim module) ──────────────────────────────────────
    extraPlugins = [
      pkgs.vimPlugins.vim-suda
      pkgs.vimPlugins.harpoon2
    ];

    # ── Autocmds ──────────────────────────────────────────────────────────────
    autoGroups.highlight_yank = {
      clear = true;
    };

    autoCmd = [
      {
        group = "highlight_yank";
        event = "TextYankPost";
        pattern = "*";
        desc = "Highlight text on yank";
        callback.__raw = "function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 }) end";
      }
    ];

    # ── Diagnostics ───────────────────────────────────────────────────────────
    extraConfigLua = ''
      local severity = vim.diagnostic.severity
      vim.diagnostic.config({
        signs = {
          text = {
            [severity.ERROR] = " ",
            [severity.WARN]  = " ",
            [severity.HINT]  = "󰠠 ",
            [severity.INFO]  = " ",
          },
        },
        virtual_text     = { current_line = true },
        underline        = true,
        update_in_insert = false,
      })
    '';
  };
}
