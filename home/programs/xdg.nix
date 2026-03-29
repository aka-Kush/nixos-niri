{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Browser
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";

      # Images
      "image/png" = "viewnior.desktop";
      "image/jpeg" = "viewnior.desktop";
      "image/gif" = "viewnior.desktop";
      "image/webp" = "viewnior.desktop";
      "image/svg+xml" = "viewnior.desktop";

      # Video
      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";

      # Audio
      "audio/mpeg" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";

      # PDF
      "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";

      # File manager
      "inode/directory" = "thunar.desktop";

      # Text
      "text/plain" = "kitty.desktop";

      # Archives
      "application/zip" = "thunar.desktop";
      "application/x-tar" = "thunar.desktop";
      "application/x-compressed-tar" = "thunar.desktop";
    };
  };
}
