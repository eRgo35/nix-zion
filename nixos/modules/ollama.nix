{pkgs, ...}: {
  nixpkgs.config.cudaSupport = true;

  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = pkgs.unstable.ollama;
  };

  # services.open-webui = {
  #   enable = false;
  #   host = "0.0.0.0";
  #   openFirewall = true;
  # };
}
