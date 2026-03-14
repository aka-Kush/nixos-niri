{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      ${pkgs.zoxide}/bin/zoxide init fish | source
    '';
    shellAliases = {
      vim = "nvim";
      ls  = "lsd -l";
      lsa = "lsd -al";
      ns  = "sudo nixos-rebuild switch --flake ~/nixos/#nixos";
      nb  = "sudo nixos-rebuild boot --flake ~/nixos/#nixos";
    };
  };
  catppuccin.fish.enable = true;

  home.packages = with pkgs; [
    zoxide
    lsd
  ];
}
