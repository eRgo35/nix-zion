{pkgs, ...}: {
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # programs
    nnn
    zellij
    vscodium

    # editors
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
    gnupg
    wireguard-tools

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
    direnv
  ];
}
