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
      background_opacity = "0.98";
      window_padding_width = 10;
      confirm_os_window_close = 0;
      window_border_width = "2px";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };

    keybindings = {
      "ctrl+shift+," = "previous_tab";
      "ctrl+shift+." = "next_tab";
    };
  };

  catppuccin.kitty.enable = true;
}
