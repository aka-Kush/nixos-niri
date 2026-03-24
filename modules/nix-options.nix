{ ... }:

{
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nixpkgs.config.allowUnfree = true;

  documentation = {
    nixos.enable = false;
    man.enable = true;
    info.enable = true;
    doc.enable = true;
  };
}
