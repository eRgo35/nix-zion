{pkgs, ...}: {
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    lutris
    mangohud
    gamemode
    vkbasalt
    wine
    # proton-ge-bin
    heroic

    prismlauncher

    # libs
    nss
    nspr
    openssl_3
  ];
}
