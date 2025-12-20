{
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = with pkgs; pinentry-all;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 3600;
      max-cache-ttl = 14400;
    };
  };
}
