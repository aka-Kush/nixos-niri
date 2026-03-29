{ pkgs, config, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.yaru-theme;
      name = "Yaru";
      size = 24;
    };
  };
}
