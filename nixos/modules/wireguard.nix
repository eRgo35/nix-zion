{config, ...}: let
  wgAddresses = {
    zion = "192.168.200.2/32";
    thor = "192.168.200.3/32";
    ragnarok = "192.168.200.5/32";
  };
in {
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [
        wgAddresses.${config.networking.hostName} or null
      ];

      dns = ["192.168.200.1"];

      privateKeyFile = "/home/mike/.nixos/secrets/wireguard-keys/${config.networking.hostName}.key";

      peers = [
        {
          publicKey = "eVXJtmhrZ2J4q4MqUGm6m8ixK/HryRgZAK5TyeGeTyo=";
          allowedIPs = [
            "192.168.200.0/24"
          ];
          endpoint = "freya.c2yz.com:123";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
