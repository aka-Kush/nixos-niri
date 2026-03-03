{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
      cursor_trail             = 1;
      enable_audio_bell        = false;
      background_opacity       = "1.0";
      window_padding_width     = 10;
      confirm_os_window_close  = 0;
    };
  };

   catppuccin.kitty.enable = true;
}
