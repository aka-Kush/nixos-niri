{ ... }:

{
  services.libinput.enable = true;

  hardware.openrazer = {
    enable = true;
    users = [ "kush" ];
    batteryNotifier.enable = false;
  };

  hardware.i2c.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
