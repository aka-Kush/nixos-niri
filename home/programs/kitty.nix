{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
      cursor_trail = 1;
      enable_audio_bell = false;
      window_padding_width = 10;
      confirm_os_window_close = 0;
      window_border_width = "2px";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      allow_remote_control = "yes";
      # shell_integration = "enabled";
      enabled_layouts = "tall,fat,grid,splits";
      # tab_bar_filter = "session";
    };

    keybindings = {
      "ctrl+shift+," = "previous_tab";
      "ctrl+shift+." = "next_tab";
      "ctrl+shift+s" = "save_as_session ~/.config/kitty/sessions";
      "ctrl+shift+p" = "goto_session ~/.config/kitty/sessions";
      "ctrl+shift+d" = "close_session";
    };
  };
}
