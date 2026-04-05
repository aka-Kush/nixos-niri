{ pkgs, ... }:
{
  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true; # handles init automatically

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      vim = "nvim";
      y = "yazi";
      t = "tmux";
      ls = "lsd -l";
      lsa = "lsd -al";
      ns = "sudo nixos-rebuild switch --flake ~/nixos/#nixos";
      nb = "sudo nixos-rebuild boot --flake ~/nixos/#nixos";
    };
    functions = {
      ff = {
        description = "Pick a zoxide dir then a file, open in nvim";
        body = ''
          set dir (zoxide query --list | fzf --preview 'eza --tree --level=2 --color=always {}')
          test -z "$dir" && return
          set file (fd --type f . $dir | fzf --preview 'bat --color=always --line-range :100 {}')
          test -n "$file" && nvim $file
        '';
      };
    };
  };

  home.packages = with pkgs; [
    lsd
    fzf
    bat
    fd
    eza
  ];
}
