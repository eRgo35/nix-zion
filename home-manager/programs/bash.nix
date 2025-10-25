{...}: let
  aliases = import ../configs/aliases.nix;
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = aliases;
  };
}
