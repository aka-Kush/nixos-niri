{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    roboto
    ubuntu-classic
  ];

  fonts.fontconfig = {
    antialias = true;
    hinting = {
      enable = true;
      style = "slight";
    };
    subpixel = {
      rgba = "rgb";
      lcdfilter = "light";
    };
  };

  stylix.fonts = {
    sansSerif = {
      package = pkgs.ubuntu-classic;
      name = "Ubuntu";
    };
    serif = {
      package = pkgs.ubuntu-classic;
      name = "Ubuntu";
    };
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };

  # these are on by default — explicit only for clarity
  stylix.targets.fontconfig.enable = true;
  stylix.targets.font-packages.enable = true;
}
