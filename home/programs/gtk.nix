{ pkgs, config, ... }:
{
  gtk.iconTheme = {
    package = pkgs.numix-icon-theme-circle;
    name = "Numix-Circle";
  };
  gtk.gtk4.theme = config.gtk.theme;
}
