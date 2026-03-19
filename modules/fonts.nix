{ pkgs, inputs, ... }:
{
  # extra fonts beyond what stylix.fonts installs
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    roboto
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro
    inputs.apple-fonts.packages.${pkgs.system}.sf-mono
    inputs.apple-fonts.packages.${pkgs.system}.ny
    ubuntu-classic
  ];

  # rendering tweaks — stylix doesn't manage these
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

  # stylix owns defaultFonts + package installation for these four
  stylix.fonts = {
    # sansSerif = {
    #   package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro;
    #   name = "SF Pro Display";
    # };
    # serif = {
    #   package = inputs.apple-fonts.packages.${pkgs.system}.ny;
    #   name = "New York";
    # };
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
