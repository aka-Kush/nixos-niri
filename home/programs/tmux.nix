{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
    ];

    # ── Prefix ──────────────────────────────────────────────────────────────
    prefix = "C-s";
    disableConfirmationPrompt = true;
    escapeTime = 0;
    mouse = true;
    baseIndex = 1;
    historyLimit = 10000;
    keyMode = "vi";
    terminal = "tmux-256color";

    extraConfig = ''
      # ── General ─────────────────────────────────────────────────────────────
      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g focus-events on
      set -g renumber-windows on
      set -g pane-base-index 1

      # ── Prefix passthrough ───────────────────────────────────────────────────
      bind C-Space send-prefix

      # ── Windows ──────────────────────────────────────────────────────────────
      bind c new-window -c "#{pane_current_path}"
      bind , command-prompt -I "#W" "rename-window '%%'"

      bind 1 select-window -t :1
      bind 2 select-window -t :2
      bind 3 select-window -t :3
      bind 4 select-window -t :4
      bind 5 select-window -t :5

      # ── Splits ───────────────────────────────────────────────────────────────
      unbind '"'
      unbind %
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # ── Pane navigation (vim-tmux-navigator, no plugin needed) ───────────────
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"

      bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
      bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
      bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
      bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
      bind C-l send-keys 'C-l'

      # ── Resize ───────────────────────────────────────────────────────────────
      bind -r Left  resize-pane -L 5
      bind -r Right resize-pane -R 5
      bind -r Down  resize-pane -D 5
      bind -r Up    resize-pane -U 5

      # ── Copy mode ────────────────────────────────────────────────────────────
      bind Enter copy-mode
      bind -T copy-mode-vi v   send -X begin-selection
      bind -T copy-mode-vi y   send -X copy-selection-and-cancel
      bind -T copy-mode-vi C-v send -X rectangle-toggle

      # ── Sessions ─────────────────────────────────────────────────────────────
      bind r source-file ~/.config/tmux/tmux.conf \; display "reloaded"
      bind S command-prompt "new-session -s '%%'"
      bind $ command-prompt -I "#S" "rename-session '%%'"

      # ── Status bar ───────────────────────────────────────────────────────────
      set -g status-position top
      # set -g status-style "bg=default,fg=#908caa"
      # set -g status-left "#[fg=#e0def4,bold] #S "
      # set -g status-right "#[fg=#908caa]%H:%M  %d %b "
      # set -g window-status-format         " #I:#W "
      # set -g window-status-current-format "#[fg=#e0def4,bold,bg=#26233a] #I:#W "
      # set -g pane-border-style        "fg=#26233a"
      # set -g pane-active-border-style "fg=#6e6a86"

    '';
  };
}
