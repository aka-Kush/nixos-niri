{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [

    # FAN SCRIPT
    (writeShellScriptBin "fan-boost-toggle" ''
      BOOST_PATH=$(grep -rl "^hp$" /sys/devices/platform/hp-wmi/hwmon/*/name 2>/dev/null | sed 's|/name||')/pwm1_enable
      current_state=$(cat "$BOOST_PATH")
      case "$current_state" in
          0)
              echo 2 | sudo tee "$BOOST_PATH" > /dev/null
              ${libnotify}/bin/notify-send "Fan Mode" "💤 Boost mode OFF"
              ;;
          2)
              echo 0 | sudo tee "$BOOST_PATH" > /dev/null
              ${libnotify}/bin/notify-send "Fan Mode" "🌀 Boost mode ON"
              ;;
          *)
              ${libnotify}/bin/notify-send -i dialog-warning "Fan Mode" "Unknown fan mode: $current_state"
              ;;
      esac
    '')

    # EXTERNAL MONITOR SCRIPT
    (writeShellApplication {
      name = "monitor-external";
      runtimeInputs = [
        pkgs.libnotify
        pkgs.niri
      ];
      text = ''
              cat > "$HOME/.config/niri/monitor.kdl" <<'EOF'
        output "HDMI-A-1" {
            mode "1920x1080@180"
            scale 1
            transform "normal"
            position x=0 y=0
        }
        output "eDP-1" {
            off
        }
        EOF
              notify-send -i display "Monitor Switch" "🖥️ External only (HDMI-A-1)"
      '';
    })

    # BOTH MONITOR SCRIPT
    (writeShellApplication {
      name = "monitor-both";
      runtimeInputs = [
        pkgs.libnotify
        pkgs.niri
      ];
      text = ''
              cat > "$HOME/.config/niri/monitor.kdl" <<'EOF'
        output "HDMI-A-1" {
            mode "1920x1080@180"
            scale 1
            transform "normal"
            position x=0 y=0
        }
        output "eDP-1" {
            mode "1920x1080@144"
            scale 1
            transform "normal"
            position x=1920 y=0
        }
        EOF
              notify-send -i display "Monitor Switch" "🖥️💻 Both monitors active"
      '';
    })

    # LAPTOP DISPLAY SCRIPT
    (writeShellApplication {
      name = "monitor-laptop";
      runtimeInputs = [
        pkgs.libnotify
        pkgs.niri
      ];
      text = ''
              cat > "$HOME/.config/niri/monitor.kdl" <<'EOF'
        output "HDMI-A-1" {
            off
        }
        output "eDP-1" {
            mode "1920x1080@144"
            scale 1
            transform "normal"
            position x=0 y=0
        }
        EOF
              notify-send -i display "Monitor Switch" "💻 Laptop only (eDP-1)"
      '';
    })

  ];
}
