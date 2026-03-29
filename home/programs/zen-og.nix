{ pkgs, ... }:
{
  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
    };

    profiles.default = {

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
      ];

      containersForce = true;
      containers = {
        Incognito = {
          color = "toolbar";
          icon = "circle";
          id = 1;
        };
      };

      search = {
        force = true;
        default = "Brave Search";
        engines = {
          "Brave" = {
            name = "Brave Search";
            urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
            definedAliases = [ "@brave" ];
          };
          "YouTube" = {
            name = "YouTube";
            urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
            icon = "https://www.youtube.com/s/desktop/f46c6d65/img/favicon_32x32.png";
            definedAliases = [ "@yt" ];
          };
          "NixOS Packages" = {
            name = "NixOS Packages";
            urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}"; } ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nix" ];
          };
        };
      };

      settings = {
        "browser.startup.page" = 3;
        "zen.startup.restore-session" = true;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "zen.urlbar.floating" = true;
        "zen.urlbar.replace-newtab" = true;
        "zen.tabs.newtab-button-at-top" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "zen.welcome-screen.seen" = true;
        "browser.startup.firstrunSkipsHomepage" = true;
        "browser.aboutwelcome.enabled" = false;
        "zen.tabs.show-newtab-vertical" = false;
      };
    };
  };
}
