{
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = with pkgs; pinentry-all;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 1200;
      max-cache-ttl = 7200;
    };
  };
}
