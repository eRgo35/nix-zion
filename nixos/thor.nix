{
  imports = [
    # Include the results of the hardware scan.
    ./hardware/thor.nix

    # Shared configuration
    ./common/audio.nix
    ./common/desktop.nix
    ./common/cache.nix
    ./common/locale.nix
    ./common/networking.nix
    ./common/system.nix

    # Active modules
    ./modules/adb.nix
    # ./modules/cuda.nix
    ./modules/development.nix
    ./modules/gnupg.nix
    ./modules/nh.nix
    # ./modules/nvidia.nix
    # ./modules/ollama.nix
    ./modules/packages.nix
    ./modules/printing.nix
    ./modules/ssh.nix
    # ./modules/swap.nix
    ./modules/users.nix
    ./modules/wireguard.nix
    ./modules/zerotier.nix
  ];

  networking.hostName = "thor"; # Define your hostname.
}
