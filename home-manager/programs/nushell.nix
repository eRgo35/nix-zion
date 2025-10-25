{...}: let
  aliases = import ../configs/aliases.nix;
in {
  programs.nushell = {
    enable = true;
    shellAliases = aliases;
    settings = {
      show_banner = false;
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
