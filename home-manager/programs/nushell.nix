{
  programs.nushell = {
    enable = true;

    shellAliases = {
      vi = "hx";
      vim = "hx";
      nano = "hx";
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
