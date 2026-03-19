{ pkgs, ... }:
{
  programs.librewolf = {
    enable = false;

    # policies is top-level, not per-profile
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

    profiles.kush = {
      isDefault = true;
      settings = {
        "privacy.resistFingerprinting" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "media.eme.enabled" = true;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "browser.startup.homepage" = "about:blank";
        "browser.newtabpage.enabled" = false;
        "browser.startup.page" = 0;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.history" = false;
        "places.history.enabled" = true;
        "browser.toolbars.bookmarks.visibility" = "never";
      };
    };
  };

  stylix.targets.librewolf = {
    enable = true;
    profileNames = [ "kush" ];
    colors.enable = true;
    fonts.enable = false;
    colorTheme.enable = false;
    firefoxGnomeTheme.enable = false;
  };
}
