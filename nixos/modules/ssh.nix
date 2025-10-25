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
}