{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;

    policies = {
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
          {
            Name = "Nix Packages";
            URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
            Alias = "@np";
          }
        ];
      };
    };
    profiles = {
      kush = {
        isDefault = true;
        id = 0;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
        ];

        settings = {
          "privacy.resistFingerprinting" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "media.eme.enabled" = true;
          "layout.css.prefers-color-scheme.content-override" = 0;
          "browser.startup.homepage" = "about:blank";
          "browser.newtabpage.enabled" = false;
          "browser.startup.page" = 3;
          "signon.autofillForms" = true;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
          "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false;
          "privacy.sanitize.sanitizeOnShutdown" = false;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.history" = false;
          "places.history.enabled" = true;
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
          # "sidebar.visibility" = "expand-on-hover";
          "sidebar.visibility" = "always-show";
          "browser.toolbars.bookmarks.visibility" = "never";
        };
      };
    };
  };
}
