{
  imports = [
    # Include the results of the hardware scan.
    ./hardware/freya.nix

    ./common/audio.nix
    ./common/locale.nix
    ./common/system.nix

    ./modules/docker.nix
    ./modules/fail2ban.nix
    ./modules/nh.nix

    ./server/bind.nix
    ./server/git.nix
    ./server/gnupg.nix
    ./server/packages.nix
    ./server/ssh.nix
    ./server/users.nix
    ./server/wireguard.nix
  ];

  networking.firewall.allowedTCPPorts = [22];
  networking.hostName = "freya"; # Define your hostname.
}
