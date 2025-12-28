{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [22];

    settings = {
      PasswordAuthentication = false;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  # Define the host keys for remote builders so that Nix can verify all the remote builders.
  # This configuration will be written to /etc/ssh/ssh_known_hosts.
  programs.ssh.knownHosts = {
    builder1 = {
      hostNames = ["192.168.0.10"];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJs6tCzUlu52VAPz8O0pFGQnYXAsCkU0wlVamhN5qHh";
    };

    ragnarok = {
      hostNames = ["ragnarok" "192.168.200.5"];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII/qClqT/ZmwVXqRf6bWI9HTSQC5j58UPZctbfLBLGr7";
    };
  };
}
