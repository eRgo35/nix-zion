{
  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;

      nvidiaSettings = true;

      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };
  };

  services.xserver.videoDrivers = ["nvidia" "modesetting"];
}
