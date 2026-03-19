{ pkgs, ... }:
{
  stylix = {
    targets = {

      nixvim = {
        enable = true;
        opacity.enable = true;
        transparentBackground.signColumn = true;
      };
      kitty = {
        fonts.enable = false;
      };
    };
  };
}
