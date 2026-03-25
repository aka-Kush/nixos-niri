{ pkgs, config, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    polarity = "light";

    cursor = {
      package = pkgs.yaru-theme;
      name = "Yaru";
      size = 24;
    };
  };
}
