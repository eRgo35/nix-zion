{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "freya" = {
        hostname = "192.168.200.1";
        identityFile = "~/.ssh/id_ed25519";
      };

      "zion" = {
        hostname = "192.168.200.2";
        identityFile = "~/.ssh/id_ed25519";
      };

      "thor" = {
        hostname = "192.168.200.3";
        identityFile = "~/.ssh/id_ed25519";
      };

      "loki" = {
        hostname = "192.168.200.4";
        identityFile = "~/.ssh/id_ed25519";
      };

      "freya.c2yz.com" = {
        hostname = "freya.c2yz.com";
        port = 8022;
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
