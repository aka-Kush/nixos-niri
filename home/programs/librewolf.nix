{ pkgs, ... }:
{
  catppuccin.librewolf.enable = true;
  programs.librewolf = {
    enable = true;

    settings = {
      # Fingerprinting (LibreWolf enables this by default)
      "privacy.resistFingerprinting" = false;

      # DRM content
      "media.eme.enabled" = true;

      # Dark theme
      "layout.css.prefers-color-scheme.content-override" = 0;

      # Blank homepage / new tab
      "browser.startup.homepage" = "about:blank";
      "browser.newtabpage.enabled" = false;
      "browser.startup.page" = 0;

      # History & cookies
      "privacy.sanitize.sanitizeOnShutdown" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.history" = false;
      "places.history.enabled" = true;

      # Hide bookmarks bar
      "browser.toolbars.bookmarks.visibility" = "never";
    };

    policies = {
      ExtensionSettings = {
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          private_browsing_allowed = true;
          default_area = "toolbar";
        };
      };

      SearchEngines = {
        Default = "Brave Search";
        Remove = [ "DuckDuckGo Lite" ];
        Add = [
          {
            Name = "Brave Search";
            URLTemplate = "https://search.brave.com/search?q={searchTerms}";
            Method = "GET";
            IconURL = "https://search.brave.com/favicon.ico";
            Alias = "@brave";
          }
          {
            Name = "Google";
            URLTemplate = "https://www.google.com/search?q={searchTerms}";
            Method = "GET";
            IconURL = "https://www.google.com/favicon.ico";
            Alias = "@g";
          }
        ];
      };
    };
  };
}
