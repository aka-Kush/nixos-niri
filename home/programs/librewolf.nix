{ pkgs, ... }:
{
  stylix.targets.librewolf = {
    enable = true;
    colors.enable = true;
    profileNames = [
      "kush"
    ];
  };

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
          {
            Name = "Home Manager Options";
            URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
            Alias = "@hm";
          }
          {
            Name = "Youtube";
            URLTemplate = "https://www.youtube.com/results?search_query={searchTerms}";
            Alias = "@yt";
          }
          {
            Name = "Nixvim Docs";
            URLTemplate = "https://nix-community.github.io/nixvim/?search={searchTerms}";
            Alias = "@nv";
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
          "sidebar.visibility" = "expand-on-hover";
          "browser.toolbars.bookmarks.visibility" = "never";
        };
      };
    };
  };
}
