{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [
        "192.168.200.2/32"
      ];

      dns = ["192.168.200.1"];

      privateKeyFile = "/home/mike/.nixos/secrets/wireguard-keys/zion.key";

      peers = [
        {
          publicKey = "VCwRK0sCVqCrQv87hRcLhwjyw0FG8GJFhdst5+IpZHo=";
          allowedIPs = [
            "192.168.200.0/24"
          ];
          endpoint = "freya.c2yz.com:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
