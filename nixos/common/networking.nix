{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  networking.stevenblack = {
    enable = true;
    block = ["fakenews" "gambling" "porn" "social"];
  };

  networking.hosts = {
    "0.0.0.0" = [
      "youtube.com"
    ];
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [22];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
