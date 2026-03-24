{ pkgs, ... }:
{
  programs.zoxide.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      ${pkgs.zoxide}/bin/zoxide init fish | source
    '';
    shellAliases = {
      vim = "nvim";
      y = "yazi";
      ls = "lsd -l";
      lsa = "lsd -al";
      ns = "sudo nixos-rebuild switch --flake ~/nixos/#nixos";
      nb = "sudo nixos-rebuild boot --flake ~/nixos/#nixos";
    };
  };

  home.packages = with pkgs; [
    lsd
  ];
}
