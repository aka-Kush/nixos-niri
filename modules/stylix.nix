{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.yaru-theme;
      name = "Yaru";
      size = 24;
    };
  };
}
