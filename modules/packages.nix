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
    file-roller
    fastfetch

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
    yazi

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
    zathura

    # File system & mounting
    udiskie
    gocryptfs
    ifuse
    ffmpegthumbnailer
    sirikali

    # VPN
    proton-vpn

    # Apps
    alacritty
    razergenie
    mission-center
    localsend
    zoom-us
    zed-editor
    # helium
    megasync
    postman
    chromium
  ];
}
