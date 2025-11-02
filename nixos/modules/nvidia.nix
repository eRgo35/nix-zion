{pkgs, ...}: {
  boot = {
    kernelModules = ["nvidia" "nvidia-uvm"];
    kernelParams = ["nvidia-drm.fbdev=1" "nvidia-drm.modeset=1"];
  };

  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;

      nvidiaSettings = true;

      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = false;
      };
    };
  };

  services.xserver.videoDrivers = ["nvidia" "modesetting"];

  environment.systemPackages = with pkgs; [
    cudatoolkit
    cudaPackages.cudnn
  ];
}
