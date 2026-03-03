{ pkgs, config, ... }:
{
  qt = {
    enable = true;
    platformTheme = {
      name = "qtct";
      package = pkgs.kdePackages.qt6ct;
    };
    style.name = "kvantum";

    qt6ctSettings = {
      Appearance = {
        icon_theme = config.gtk.iconTheme.name;
      };
    };
  };

  catppuccin.kvantum.enable = true;
  catppuccin.kvantum.apply = true;
  catppuccin.qt5ct.enable = true;
}
