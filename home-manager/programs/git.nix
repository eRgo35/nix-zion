{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Michał Czyż";
        email = "mike@c2yz.com";
      };

      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      commit.gpgsign = true;
      push.enabled = true;
      column.ui = "auto";
      branch.sort = "-committerdate";
      pull.rebase = "false";
      rerere.enabled = true;
      tag.gpgSign = true;
      push.gpgsign = "if-asked";
    };

    signing = {
      key = "9745B9E27E2B1ABB";
      signByDefault = true;
    };
  };
}
