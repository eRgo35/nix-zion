{
  ####################################################################
  #
  #  NixOS's Configuration for Remote Building / Distributed Building
  #
  ####################################################################

  # Set local's max-jobs to 0 to force remote building (disable local building).
  # nix.settings.max-jobs = 0;

  # Required, otherwise remote buildMachines aren't used
  nix.distributedBuilds = true;

  nix.buildMachines = let
    sshUser = "mike";
    # Path to the SSH key on the local machine (must be accessible by root)
    sshKey = "/root/.ssh/id_ed25519";
    system = "x86_64-linux";
    protocol = "ssh-ng";
    supportedFeatures = [
      "nixos-test"
      "benchmark"
      "big-parallel"
      "kvm"
    ];
  in [
    {
      inherit sshUser sshKey system protocol supportedFeatures;
      hostName = "192.168.0.10";
      maxJobs = 3;
      speedFactor = 4;
      mandatoryFeatures = [];
    }
    {
      inherit sshUser sshKey system protocol supportedFeatures;
      hostName = "ragnarok"; # 192.168.200.5
      maxJobs = 3;
      speedFactor = 4;
      mandatoryFeatures = [];
    }
  ];

  # Optional: Useful when the builder has a faster internet connection than yours
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
}
