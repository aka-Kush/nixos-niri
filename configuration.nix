{
  config,
  lib,
  pkgs,
  ...
}:

{
  ############################################################
  # Imports
  ############################################################

  imports = [
    ./hardware-configuration.nix
    ./modules/gaming.nix
  ];

  ############################################################
  # Boot Configuration
  ############################################################

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    consoleLogLevel = 0;
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "rd.udev.log_level=3"
    ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    plymouth.enable = true;
  };

  ############################################################
  # Networking & Time
  ############################################################

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  ############################################################
  # Localization
  ############################################################

  i18n.defaultLocale = "en_US.UTF-8";

  ############################################################
  # User Configuration
  ############################################################

  users.users.kush = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
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

  ############################################################
  # Nix Configuration
  ############################################################

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

  ############################################################
  # Graphics & GPU (NVIDIA + PRIME)
  ############################################################

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    powerManagement = {
      enable = true;
      finegrained = true; # turns dGPU off when not in use, big battery win
    };

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:6:0:0";
    };
  };

  ############################################################
  # Audio (PipeWire)
  ############################################################

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  ############################################################
  # Input Devices
  ############################################################

  services.libinput.enable = true;

  hardware.openrazer = {
    enable = true;
    users = [ "kush" ];
  };

  ############################################################
  # Bluetooth
  ############################################################

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.blueman.enable = true;

  ############################################################
  # Power Management
  ############################################################

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  ############################################################
  # Fonts & Font Rendering
  ############################################################

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.meslo-lg
      roboto
      nerd-fonts.fira-code
    ];

    fontconfig = {
      enable = true;
      antialias = true;

      hinting = {
        enable = true;
        style = "slight";
      };

      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };

      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Sans Mono"
        ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  ############################################################
  # Desktop Environment / Display
  ############################################################

  services.xserver.xkb.layout = "us";

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.ly.enable = true;

  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland.enable = true;
  # };

  ############################################################
  # XDG Portals (Wayland compatibility)
  ############################################################

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  ############################################################
  # File Management & Removable Media
  ############################################################

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  ############################################################
  # Firewall settings
  ############################################################

  networking.firewall = {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };

  ############################################################
  # Authentication & Keyring
  ############################################################

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  systemd.user.services.polkit-gnome-agent.enable = true;

  #  systemd.user.services.polkit-gnome-agent = {
  #    Unit = {
  #      Description = "GNOME Polkit authentication agent";
  #      After = [ "niri.service" ];
  #      WantedBy = [ "niri.service" ];
  #    };
  #
  #    Service = {
  #      ExecStart =
  #        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #      Restart = "on-failure";
  #      RestartSec = 3;
  #    };
  #  };

  ############################################################
  # Environment Variables
  ############################################################

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_SIZE = "24";
  };

  ############################################################
  # System Packages
  ############################################################

  environment.systemPackages = with pkgs; [
    # Core system tools
    home-manager
    wget
    curl
    unzip
    unrar
    p7zip
    rsync

    # Wayland / Display
    xwayland-satellite
    wlsunset
    wl-clipboard
    cliphist
    brightnessctl

    # Authentication & Keyring
    polkit_gnome
    gnome-keyring
    libsecret
    seahorse

    # Notifications
    libnotify

    # Terminal utilities
    fzf
    ripgrep
    fd
    bat
    tldr
    btop

    # Build tools
    gcc
    gnumake
    autoconf
    automake
    libtool
    cmake
    pkg-config
    gnupg
    sassc

    # Languages & runtimes
    nodejs
    nodePackages.npm
    python3
    go
    luarocks

    # Media
    mpv
    viewnior
    pavucontrol

    # Office & Files
    libreoffice-fresh
    qbittorrent
    anytype

    # File system & mounting
    udiskie
    gocryptfs
    ifuse
    ffmpegthumbnailer

    # VPN
    protonvpn-gui

    # Apps
    vesktop
    spotify
    vscodium
    razergenie
    mission-center
    localsend

    (writeShellScriptBin "fan-boost-toggle" ''
      BOOST_PATH=$(grep -rl "^hp$" /sys/devices/platform/hp-wmi/hwmon/*/name 2>/dev/null | sed 's|/name||')/pwm1_enable
      current_state=$(cat "$BOOST_PATH")
      case "$current_state" in
          0)
              echo 2 | sudo tee "$BOOST_PATH" > /dev/null
              ${libnotify}/bin/notify-send -i fan "Fan Mode" "💤 Boost mode OFF"
              ;;
          2)
              echo 0 | sudo tee "$BOOST_PATH" > /dev/null
              ${libnotify}/bin/notify-send -i fan "Fan Mode" "🌀 Boost mode ON"
              ;;
          *)
              ${libnotify}/bin/notify-send -i dialog-warning "Fan Mode" "Unknown fan mode: $current_state"
              ;;
      esac
    '')

  ];

  system.stateVersion = "25.11";
}
