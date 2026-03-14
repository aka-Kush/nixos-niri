{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # Core system tools
    wget
    curl
    unzip
    unrar
    p7zip
    rsync
    jq

    # Wayland / Display
    xwayland-satellite
    wlsunset
    wl-clipboard
    cliphist
    brightnessctl
    ddcutil
    ddcui

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
    tree

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
    opencode

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
    razergenie
    mission-center
    localsend
    zoom-us
    zed-editor
    brave
  ];
}
