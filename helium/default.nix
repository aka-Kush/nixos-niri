{
  lib,
  fetchurl,
  appimageTools,
  stdenv,
  widevine-cdm,
  enableWideVine ? false,
}:
let
  pname = "helium";
  version = "0.10.5.1";
  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
    hash = "sha256-c/ea8C1XjTkBo0/ujGHEbKWyCmRMxyuiuOzAO9AMf1o=";
  };
  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
    postExtract = lib.optionalString enableWideVine ''
      mkdir -p $out/opt/helium/WidevineCdm
      cp -a ${widevine-cdm}/share/google/chrome/WidevineCdm/* $out/opt/helium/WidevineCdm/
    '';
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -Dm444 \
      ${appimageContents}/helium.desktop \
      $out/share/applications/helium.desktop
    substituteInPlace $out/share/applications/helium.desktop \
      --replace-fail 'Exec=helium' 'Exec=helium --ozone-platform=wayland --enable-features=WaylandWindowDecorations'

    install -Dm444 \
      ${appimageContents}/usr/share/icons/hicolor/256x256/apps/helium.png \
      $out/share/icons/hicolor/256x256/apps/helium.png

    mkdir -p $out/share/lib/helium
    cp -r ${appimageContents}/opt/helium/locales $out/share/lib/helium/

  '';
  meta = {
    description = "Private, fast, and honest web browser based on Chromium";
    homepage = "https://helium.computer";
    changelog = "https://github.com/imputnet/helium-linux/releases/tag/${version}";
    license = if enableWideVine then lib.licenses.unfree else lib.licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
    mainProgram = "helium";
  };
}
