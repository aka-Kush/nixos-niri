{ ... }:
{
  stylix = {
    targets = {

      kitty = {
        fonts.enable = false;
      };
      zen-browser = {
        enable = true;
        enableCss = true;
        profileNames = [ "default" ];
      };
      librewolf = {
        enable = true;
        profileNames = [
          "kush"
        ];
      };
    };
  };
}
