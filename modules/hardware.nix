{ pkgs, ... }:

{
  services.libinput.enable = true;

  hardware.openrazer = {
    enable = true;
    users = [ "kush" ];
    batteryNotifier.enable = false;
  };

  hardware.i2c.enable = true;
  hardware.uinput.enable = true;
  services.udev.packages = [ pkgs.game-devices-udev-rules ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
