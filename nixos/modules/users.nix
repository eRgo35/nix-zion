{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mike = {
    isNormalUser = true;
    description = "Michał Czyż";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.nushell;
  };
}
