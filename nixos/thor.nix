{
  imports = [
    # Include the results of the hardware scan.
    ./hardware/thor.nix

    # Shared configuration
    ./common/audio.nix
    ./common/bluetooth.nix
    ./common/desktop.nix
    ./common/cache.nix
    ./common/locale.nix
    ./common/networking.nix
    ./common/security.nix
    ./common/system.nix

    ./desktop/packages.nix

    ./development/development.nix
    ./development/python-nocuda.nix

    # Active modules
    ./modules/adb.nix
    ./modules/docker.nix
    ./modules/gnupg.nix
    ./modules/nh.nix
    ./modules/printing.nix
    ./modules/ssh.nix
    ./modules/users.nix
    ./modules/wireguard.nix
    ./modules/zerotier.nix
  ];

  networking.hostName = "thor"; # Define your hostname.
}
