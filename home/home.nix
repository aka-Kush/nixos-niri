{
  pkgs,
  inputs,
  config,
  ...
}:
{

  imports = [
    ./programs/kitty.nix
    ./programs/librewolf.nix
    ./programs/fish.nix
    ./programs/spicetify.nix
    ./programs/noctalia.nix
    ./programs/vesktop.nix
    ./programs/opencode.nix
    ./programs/xdg.nix
    ./programs/tmux.nix
    ./programs/nixvim.nix
    ./programs/stylix.nix
    ./programs/zen.nix
    ./programs/nix-search-tv.nix
  ];

  home.username = "kush";
  home.homeDirectory = "/home/kush";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "librewolf";
    VISUAL = "nvim";
    XCURSOR_THEME = "Yaru";
    XCURSOR_SIZE = 24;
  };
}
