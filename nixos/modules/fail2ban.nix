{
  services.fail2ban = {
    enable = true;
    ignoreIP = [
      "127.0.0.1/8"
      "192.168.0.0/24"
      "83.230.5.153"
    ];
  };
}
