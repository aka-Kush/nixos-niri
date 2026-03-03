{ pkgs, config, ... }:
{

  catppuccin = {
    flavor = "mocha";
    accent = "mauve";
  };

catppuccin.gtk.icon.enable = true;

  gtk = {
    enable = true;
    colorScheme = "dark";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.theme = config.gtk.theme;
   theme = {
    name = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-compact";
    package = pkgs.catppuccin-gtk.override {
      accents = [ config.catppuccin.accent ];
      variant = config.catppuccin.flavor;
      size = "compact";
    };
  };

    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };

    font = {
      name = "Roboto";
      size = 11;
    };
  };


home.pointerCursor = {
    package = pkgs.yaru-theme;
    name = "Yaru";
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };


}
