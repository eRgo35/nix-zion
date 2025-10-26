{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mike = {
    isNormalUser = true;
    description = "Michał Czyż";
    extraGroups = ["networkmanager" "wheel" "docker"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3xXO97oTwDMQhwlDcgeRgo+05urrSaKv/bvqvH2Wus mike@thor"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMCj2eJcNnzYW3O64LFunkDeQDPShD2oK/nivcwzSgwe u0_a670@localhost"
    ];
    # shell = pkgs.nushell;
  };
}
