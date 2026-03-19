{ pkgs, ... }:
{
  # ── Steam ──────────────────────────────────────────────────────────────
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [
      gamemode
      mangohud
    ];
  };

  # ── Gamescope ──────────────────────────────────────────────────────────
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # ── Gamemode ───────────────────────────────────────────────────────────
  programs.gamemode.enable = true;

  # ── Gaming Packages ────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # Launchers
    faugus-launcher
    umu-launcher
    protonup-qt # manage ProtonGE versions
    pcsx2

    # Wine
    wine
    winetricks
    protontricks

    # Vulkan
    vulkan-tools
    vulkan-validation-layers

    # Performance monitoring
    mangohud
    nvtopPackages.nvidia

    # Audio
    alsa-plugins
    openal
    mpg123

    # Media libs
    giflib
    libxslt
    libjpeg
    libva
    libva-utils

    # Fonts
    liberation_ttf
  ];
}
