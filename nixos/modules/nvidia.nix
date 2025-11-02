{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelModules = ["nvidia" "nvidia-uvm"];
    kernelParams = ["nvidia-drm.fbdev=1" "nvidia-drm.modeset=1"];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      powerManagement = {
        enable = true;
        finegrained = false;
      };
    };

    nvidia-container-toolkit.enable = true;
  };

  services.xserver.videoDrivers = ["nvidia" "modesetting"];

  environment.systemPackages = with pkgs; [
    cudatoolkit
    cudaPackages.cudnn
  ];
}
