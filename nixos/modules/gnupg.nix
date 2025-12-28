{
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = with pkgs; pinentry-all;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 14400;
      max-cache-ttl = 28800;
    };
  };
}
