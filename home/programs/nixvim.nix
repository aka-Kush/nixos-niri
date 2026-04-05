{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

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
      typescript-language-server
      prettier
      eslint
      tailwindcss
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

      # Yazi
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>-";
        action = ":Yazi<CR>";
      }

      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>_";
        action = ":Yazi toggle<CR>";
      }

      # Window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "TmuxNavigateLeft<cr>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "TmuxNavigateDown<cr>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "TmuxNavigateUp<cr>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "TmuxNavigateRight<cr>";
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
        action.__raw = "function() require('conform').format({ async = true, lsp_fallback = true }) end";
        options = {
          desc = "Format file";
        };
      }
      {
        mode = "n";
        key = "gd";
        action.__raw = "vim.lsp.buf.definition";
        options = {
          noremap = true;
          silent = true;
          desc = "Go to definition";
        };
      }
      {
        mode = "n";
        key = "gD";
        action.__raw = "vim.lsp.buf.declaration";
        options = {
          noremap = true;
          silent = true;
          desc = "Go to declaration";
        };
      }
      {
        mode = "n";
        key = "gr";
        action.__raw = "vim.lsp.buf.references";
        options = {
          noremap = true;
          silent = true;
          desc = "Go to references";
        };
      }
      {
        mode = "n";
        key = "gi";
        action.__raw = "vim.lsp.buf.implementation";
        options = {
          noremap = true;
          silent = true;
          desc = "Go to implementation";
        };
      }
      {
        mode = "n";
        key = "K";
        action.__raw = "vim.lsp.buf.hover";
        options = {
          noremap = true;
          silent = true;
          desc = "Hover docs";
        };
      }
      {
        mode = "n";
        key = "<leader>rn";
        action.__raw = "function() return ':IncRename ' .. vim.fn.expand('<cword>') end";
        options = {
          expr = true;
          desc = "Rename (live preview)";
        };
      }
      {
        mode = "n";
        key = "<leader>ca";
        action.__raw = "vim.lsp.buf.code_action";
        options = {
          noremap = true;
          silent = true;
          desc = "Code action";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<CMD>Oil<CR>";
        options = {
          desc = "Oil: open float (current dir)";
          silent = true;
        };
      }

      # suda
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

      # aerial
      {
        mode = "n";
        key = "<leader>o";
        action = ":AerialToggle<CR>";
        options = {
          silent = true;
          desc = "Symbols outline";
        };
      }

      # Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action.__raw = "function() require('telescope.builtin').find_files({ cwd = require('project.api').get_project_root() }) end";
        options.desc = "Find project files";
      }

      {
        mode = "n";
        key = "<leader>fg";
        action.__raw = "function() require('telescope.builtin').live_grep({ cwd = require('project.api').get_project_root() }) end";
        options.desc = "Live grep (project)";
      }

      {
        mode = "n";
        key = "<leader>fb";
        action.__raw = "function() require('telescope.builtin').buffers() end";
        options.desc = "Buffers";
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
        key = "<leader>fr";
        action.__raw = "function() require('telescope.builtin').find_files({ cwd = '/home/kush', hidden=false}) end";
        options.desc = "Find from root";
      }

      {
        mode = "n";
        key = "<leader>fd";
        action.__raw = "function() require('telescope.builtin').find_files({ hidden = true, cwd = vim.fn.expand('~/.config/') }) end";
        options.desc = "Find dotfiles";
      }

      {
        mode = "n";
        key = "<leader>fo";
        action.__raw = "function() require('telescope.builtin').oldfiles() end";
        options.desc = "Recent files";
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

      undotree.enable = true;

      tmux-navigator.enable = true;

      inc-rename.enable = true;

      yazi.enable = true;

      mini-surround = {
        enable = true;
        modules = {
          surround = {
            mappings = {
              add = "sa"; # sa<motion><char>  e.g. saiw"
              delete = "sd"; # sd<char>          e.g. sd"
              replace = "sr"; # sr<old><new>       e.g. sr"'
              find = "sf"; # find surrounding to the right
              find_left = "sF"; # find surrounding to the left
              highlight = "sh"; # flash-highlight surrounding
            };
          };
        };
      };

      aerial = {
        enable = true;
        settings = {
          layout = {
            default_direction = "right";
          };
          show_guides = true;
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<C-\\>]]";
          direction = "float";
          float_opts.border = "rounded";
          shade_terminals = false;
        };
      };

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

      render-markdown.enable = true;

      # bufferline.enable = true;

      notify = {
        enable = true;
        settings = {
          background_colour = "#000000";
          timeout = 3000;
          max_width = 50;
          stages = "fade_in_slide_out";
          render = "default";
        };
      };

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
          keymap.preset = "super-tab";
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
          ts_ls.enable = true;
          tailwindcss.enable = true;
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
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
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
          javascript = [ "eslint" ];
          typescript = [ "eslint" ];
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
          pickers = {

            colorscheme = {
              enable_preview = true;
            };
            buffers.mappings = {
              i = {
                "<c-d>" = "delete_buffer";
              };
              n = {
                "<c-d>" = "delete_buffer";
              };
            };
          };
          extensions = {
            ui-select = {
              enable = true;
              settings.__raw = ''require("telescope.themes").get_dropdown({})'';
            };
          };

        };
      };

      project-nvim = {
        enable = true;
        enableTelescope = true;
        settings = {
          detection_methods = [ "pattern" ];
          patterns = [
            ".git"
            ".github"
            "flake.nix"
            "Makefile"
            "package.json"
            "Cargo.toml"
          ];
          silent_chdir = true;
          scope_chdir = "global";
          show_hidden = true;
          historysize = 100;
          lsp = {
            enabled = true;
            use_pattern_matching = true;
          };
          telescope = {
            sort = "newest";
          };
        };
      };

      flash.enable = true;

      oil = {
        enable = true;
        settings = {
          keymaps = {
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
      pkgs.vimPlugins.vim-cool
      # pkgs.vimPlugins.vim-tpipeline
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
      });

      function ToggleCheckbox()
        local line = vim.api.nvim_get_current_line()
        local indent = string.match(line, "^%s*") or ""
        local content = string.gsub(line, "^%s*", "")

        if string.match(content, "^%- %[ %]") then
          content = string.gsub(content, "%[ %]", "[x]", 1)
        elseif string.match(content, "^%- %[x%]") then
          content = string.gsub(content, "%[x%]", "[ ]", 1)
        else
          content = "- [ ] " .. content
        end

        vim.api.nvim_set_current_line(indent .. content)
      end

      vim.keymap.set("n", ";;x", ToggleCheckbox, { noremap = true, silent = true })
    '';
  };
}
