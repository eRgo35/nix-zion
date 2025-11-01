{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./common/audio.nix
    ./common/desktop.nix
    ./common/cache.nix
    ./common/locale.nix
    ./common/networking.nix
    ./common/system.nix

    ./modules/adb.nix
    ./modules/cuda.nix
    ./modules/development.nix
    ./modules/gnupg.nix
    ./modules/nh.nix
    ./modules/nvidia.nix
    ./modules/ollama.nix
    ./modules/packages.nix
    ./modules/printing.nix
    ./modules/ssh.nix
    ./modules/swap.nix
    ./modules/users.nix
    ./modules/wireguard.nix
    ./modules/zerotier.nix
  ];

  networking.hostName = "zion"; # Define your hostname.

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
