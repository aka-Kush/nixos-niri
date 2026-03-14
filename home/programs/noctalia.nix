{ ... }:
{
  programs.noctalia-shell = {
    enable = true;

    # --- Catppuccin Mocha color scheme ---
    colors = {
      mError = "#f38ba8";
      mHover = "#94e2d5";
      mOnError = "#11111b";
      mOnHover = "#11111b";
      mOnPrimary = "#11111b";
      mOnSecondary = "#11111b";
      mOnSurface = "#cdd6f4";
      mOnSurfaceVariant = "#a3b4eb";
      mOnTertiary = "#11111b";
      mOutline = "#4c4f69";
      mPrimary = "#cba6f7";
      mSecondary = "#fab387";
      mShadow = "#11111b";
      mSurface = "#1e1e2e";
      mSurfaceVariant = "#313244";
      mTertiary = "#94e2d5";
    };

    # --- Plugins ---
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = { };
      version = 2;
    };

    # --- User templates (currently empty / placeholder) ---
    user-templates = {
      config = { };
      templates = { };
    };

    # --- Settings (only non-default values) ---
    settings = {

      # App Launcher
      appLauncher = {
        enableClipboardHistory = true;
        showCategories = false;
        sortByMostUsed = false;
        terminalCommand = "xterm -e";
        viewMode = "grid";
      };

      # Audio
      audio = {
        volumeOverdrive = true;
      };

      # Bar
      bar = {
        backgroundOpacity = 0.95;
        capsuleOpacity = 0.9;
        marginHorizontal = 8;
        marginVertical = 8;
        useSeparateOpacity = true;
        widgets = {
          left = [
            {
              id = "Launcher";
              icon = "rocket";
              useDistroLogo = false;
              enableColorization = true;
              colorizeSystemIcon = "tertiary";
              customIconPath = "";
              iconColor = "none";
            }
            {
              id = "Clock";
              formatHorizontal = "h:mm AP";
              formatVertical = "HH mm - dd MM";
              clockColor = "none";
              tooltipFormat = "HH:mm ddd, MMM dd";
              customFont = "";
              useCustomFont = false;
            }
            {
              id = "MediaMini";
              compactMode = false;
              hideMode = "hidden";
              hideWhenIdle = false;
              maxWidth = 145;
              panelShowAlbumArt = true;
              scrollingMode = "hover";
              showAlbumArt = true;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = false;
              textColor = "none";
              useFixedWidth = false;
              visualizerType = "linear";
            }
          ];
          center = [
            {
              id = "Workspace";
              fontWeight = "bold";
              showBadge = true;
              enableScrollWheel = true;
              hideUnoccupied = false;
              labelMode = "none";
              focusedColor = "primary";
              emptyColor = "none";
              occupiedColor = "none";
              pillSize = 0.6;
              characterCount = 2;
              colorizeIcons = false;
              followFocusedScreen = false;
              groupedBorderOpacity = 1;
              iconScale = 0.8;
              showApplications = false;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
          ];
          right = [
            {
              id = "Tray";
              blacklist = [ "spotify-client" ];
              chevronColor = "none";
              colorizeIcons = false;
              drawerEnabled = false;
              hidePassive = false;
              pinned = [ ];
            }
            {
              id = "NotificationHistory";
              hideWhenZero = true;
              hideWhenZeroUnread = true;
              iconColor = "none";
              showUnreadBadge = true;
              unreadBadgeColor = "primary";
            }
            {
              id = "Bluetooth";
              displayMode = "onhover";
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "Network";
              displayMode = "onhover";
              iconColor = "none";
              textColor = "none";
            }
            {
              # Fan Control button
              id = "CustomButton";
              icon = "car-fan";
              generalTooltipText = "Fan Control";
              hideMode = "alwaysExpanded";
              leftClickExec = "fan-boost-toggle";
              leftClickUpdateText = true;
              showIcon = true;
              enableColorization = false;
              colorizeSystemIcon = "none";
              ipcIdentifier = "";
              maxTextLength = {
                horizontal = 10;
                vertical = 10;
              };
              middleClickExec = "";
              middleClickUpdateText = false;
              parseJson = false;
              rightClickExec = "";
              rightClickUpdateText = false;
              showExecTooltip = false;
              showTextTooltip = false;
              textCollapse = "";
              textCommand = "";
              textIntervalMs = 3000;
              textStream = false;
              wheelDownExec = "";
              wheelDownUpdateText = false;
              wheelExec = "";
              wheelMode = "unified";
              wheelUpExec = "";
              wheelUpUpdateText = false;
              wheelUpdateText = false;
            }
            {
              id = "Battery";
              deviceNativePath = "__default__";
              displayMode = "graphic";
              hideIfIdle = false;
              hideIfNotDetected = false;
              showNoctaliaPerformance = false;
              showPowerProfiles = true;
            }
            {
              id = "Volume";
              displayMode = "onhover";
              iconColor = "none";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }
            {
              id = "NightLight";
              iconColor = "none";
            }
            {
              id = "Brightness";
              applyToAllMonitors = false;
              displayMode = "onhover";
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
              enableColorization = true;
              colorizeSystemIcon = "secondary";
              colorizeDistroLogo = false;
              customIconPath = "";
              icon = "power";
            }
          ];
        };
      };

      # Brightness
      brightness = {
        enableDdcSupport = true;
        backlightDeviceMappings = [
          {
            device = "/sys/class/backlight/amdgpu_bl1";
            output = "eDP-1";
          }
        ];
      };

      # Calendar
      calendar = {
        cards = [
          { enabled = true; id = "calendar-header-card"; }
          { enabled = true; id = "calendar-month-card"; }
          { enabled = false; id = "weather-card"; }
        ];
      };

      # Color Schemes
      colorSchemes = {
        predefinedScheme = "Catppuccin";
        generationMethod = "content";
      };

      # Control Center
      controlCenter = {
        cards = [
          { enabled = true; id = "profile-card"; }
          { enabled = false; id = "shortcuts-card"; }
          { enabled = true; id = "audio-card"; }
          { enabled = true; id = "brightness-card"; }
          { enabled = false; id = "weather-card"; }
          { enabled = false; id = "media-sysmon-card"; }
        ];
        shortcuts = {
          left = [ ];
          right = [ ];
        };
      };

      # Desktop Widgets
      desktopWidgets = {
        enabled = false;
        overviewEnabled = true;
      };

      # Dock (disabled)
      dock = {
        enabled = false;
        floatingRatio = 0.49;
      };

      # General
      general = {
        avatarImage = "/home/kush/.face";
        clockFormat = "hh\\nmm";
        clockStyle = "custom";
        enableShadows = false;
        radiusRatio = 0.7;
      };

      # Location
      location = {
        name = "Delhi India";
        use12hourFormat = true;
        weatherEnabled = false;
      };

      # Network
      network = {
        bluetoothRssiPollIntervalMs = 10000;
      };

      # Session Menu
      sessionMenu = {
        countdownDuration = 3000;
        powerOptions = [
          { action = "lock"; enabled = true; keybind = "1"; command = ""; countdownEnabled = true; }
          { action = "suspend"; enabled = true; keybind = "2"; command = ""; countdownEnabled = false; }
          { action = "hibernate"; enabled = true; keybind = "3"; command = ""; countdownEnabled = false; }
          { action = "reboot"; enabled = true; keybind = "4"; command = ""; countdownEnabled = true; }
          { action = "logout"; enabled = true; keybind = "5"; command = ""; countdownEnabled = true; }
          { action = "shutdown"; enabled = true; keybind = "6"; command = ""; countdownEnabled = true; }
          { action = "userspaceReboot"; enabled = false; keybind = ""; command = ""; countdownEnabled = true; }
          { action = "rebootToUefi"; enabled = true; keybind = "7"; command = ""; countdownEnabled = true; }
        ];
      };

      # Templates (niri template active, user theming on)
      templates = {
        activeTemplates = [
          { enabled = true; id = "niri"; }
        ];
        enableUserTheming = true;
      };

      # UI
      ui = {
        fontDefault = "Noto Sans";
        fontFixed = "JetBrainsMono NF";
        settingsPanelSideBarCardStyle = true;
      };

      # Wallpaper
      wallpaper = {
        directory = "/home/kush/Pictures/walls";
        transitionDuration = 1000;
        transitionType = "wipe";
        viewMode = "browse";
      };
    };
  };
}
