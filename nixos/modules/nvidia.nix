{
  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;

      nvidiaSettings = true;

      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
  };

  services.xserver.videoDrivers = ["nvidia" "modesetting"];
}
