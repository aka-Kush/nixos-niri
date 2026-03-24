{ pkgs, ... }:

{
  users.users.kush = {
    isNormalUser = true;
    description = "Shivansh Kush";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "input"
      "video"
      "render"
      "docker"
      "kvm"
      "libvirtd"
      "i2c"
    ];
    shell = pkgs.fish;
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "aka-Kush";
      user.email = "kushivansh27@gmail.com";
    };
  };

  programs.fish.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
