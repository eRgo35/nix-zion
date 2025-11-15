{
  imports = [
    ./programs/bash.nix
    ./programs/git.nix
    ./programs/nushell.nix
    ./programs/ssh.nix
    ./programs/starship.nix
  ];

  home = {
    username = "mike";
    homeDirectory = "/home/mike";
  };

  home.file = {
    ".local/bin/ns" = {
      source = ./bin/ns;
      executable = true;
    };
    ".local/bin/rmount" = {
      source = ./bin/rmount;
      executable = true;
    };
    ".local/bin/urmount" = {
      source = ./bin/urmount;
      executable = true;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
