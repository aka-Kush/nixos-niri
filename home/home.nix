{
  pkgs,
  inputs,
  config,
  ...
}:
{

  imports = [
    ./programs/kitty.nix
    ./programs/fish.nix
    ./programs/gtk.nix
    ./programs/qt.nix
    ./programs/noctalia.nix
    ./programs/xdg.nix
    ./programs/nixvim.nix
    ./programs/librewolf.nix
  ];

  home.username = "kush";
  home.homeDirectory = "/home/kush";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR_THEME = "Yaru";
    XCURSOR_SIZE = 24;
  };

  programs.home-manager.enable = true;
  news.display = "silent";
}
