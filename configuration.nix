{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/users.nix
    ./modules/nix-options.nix
    ./modules/nvidia.nix
    ./modules/audio.nix
    ./modules/hardware.nix
    ./modules/power.nix
    ./modules/fonts.nix
    ./modules/desktop.nix
    ./modules/security.nix
    ./modules/thunar.nix
    ./modules/packages.nix
    ./modules/scripts.nix
    ./modules/gaming.nix
    ./modules/docker.nix
  ];

  system.stateVersion = "25.11";
}
