{
  imports = [
    # Include the results of the hardware scan.
    ./hardware/ragnarok.nix

    ./common/audio.nix
    ./common/cache.nix
    ./common/locale.nix
    ./common/system.nix

    ./development/development.nix
    ./development/python.nix

    ./modules/docker.nix
    ./modules/nh.nix
    ./modules/nvidia.nix
    ./modules/ollama.nix
    ./modules/zerotier.nix

    ./server/packages.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    mike = {
      isNormalUser = true;
      description = "Michał Czyż";
      extraGroups = ["networkmanager" "wheel" "docker" "video"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINBehbdWBTyhs8Tqnc7w172XhWcPAcAM6BC9Gny3i8An mike@zion"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3xXO97oTwDMQhwlDcgeRgo+05urrSaKv/bvqvH2Wus mike@thor"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMCj2eJcNnzYW3O64LFunkDeQDPShD2oK/nivcwzSgwe u0_a670@localhost"
      ];
    };
    wiecz = {
      isNormalUser = true;
      description = "Jakub Wieczorek";
      extraGroups = ["networkmanager" "wheel" "docker" "video"];
    };
  };

  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall.enable = false;
  networking.hostName = "ragnarok"; # Define your hostname.
}
