{
  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;

      nvidiaSettings = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
  };

  services.xserver.videoDrivers = ["nvidia"];
}
