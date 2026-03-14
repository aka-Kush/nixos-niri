{ pkgs, ... }:
{
  virtualisation = {
    libvirtd.enable = true;
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    docker
    freerdp
    winboat
  ];

  virtualisation.oci-containers.containers.portainer = {
    image = "portainer/portainer-ce";
    ports = [ "9000:9000" ];
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "portainer_data:/data"
    ];
  };

  systemd.services."virt-secret-init-encryption".enable = false;
}
