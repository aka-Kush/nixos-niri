{ config, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    loadModels = [
      "qwen2.5-coder:14b"
      "deepseek-r1:14b"
    ];
  };

  users.users.kush.extraGroups = [ "ollama" ];
}
