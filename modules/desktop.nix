{ pkgs, ... }:

{
  services.xserver.xkb.layout = "us";

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  services.displayManager.gdm.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_SIZE = "24";
  };
}
