{pkgs, ...}: {
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # social
    discord
    signal-desktop-bin
    kotatogram-desktop

    # web
    google-chrome
    firefox-bin

    # tools
    nnn
    zellij
    libreoffice
    seahorse

    # media
    spotify
    vlc
    mpv
    obs-studio

    # ide
    android-studio

    # editors
    obsidian
    zed-editor
    vscodium
    vim
    neovim

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    git
    inxi
    fastfetch
    wget
    ripgrep
    jq
    fzf
    btop
    iotop
    iftop
    tldr
    killall
    gnupg
    wireguard-tools
    wol

    # system call monitoring
    strace
    ltrace
    lsof

    # system tools
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils

    # networking tools
    mtr
    dnsutils
    ldns
    aria2
    socat
    nmap

    # nix
    nix-output-monitor
    alejandra
    nixd
    nil
    direnv
  ];
}
