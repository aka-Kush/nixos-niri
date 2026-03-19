{ pkgs, ... }:
{
  gtk.iconTheme = {
    package = pkgs.numix-icon-theme-circle;
    name = "Numix-Circle";
  };
}
