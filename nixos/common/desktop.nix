{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-browser-integration
  ];

  environment.sessionVariables = {
    SSH_ASKPASS_REQUIRE = "prefer";
  };
}
