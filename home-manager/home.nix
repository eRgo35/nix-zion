{
  imports = [
    ./programs/bash.nix
    ./programs/git.nix
    ./programs/nushell.nix
    ./programs/starship.nix
  ];

  home = {
    username = "mike";
    homeDirectory = "/home/mike";
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
