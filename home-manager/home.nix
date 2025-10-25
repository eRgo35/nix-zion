{
  imports = [
    ./programs/git.nix
  ];

  home = {
    username = "mike";
    homeDirectory = "/home/mike";
  };

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      la = "ls -la";
      ga = "git add";
      gaa = "git add .";
      gap = "git add -p";
      gs = "git status";
      gc = "git commit -m";
      gu = "git push";
      gp = "git pull";
      up = "docker compose up";
      down = "docker compose down";
      logs = "docker compose logs";
      dps = "docker compose ps";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}