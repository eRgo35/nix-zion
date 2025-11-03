{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      zstd
      stdenv.cc.cc
      curl
      openssl
      attr
      libssh
      bzip2
      libxml2
      acl
      libsodium
      util-linux
      xz
      systemd
    ];
  };

  # https://github.com/nix-community/nix-ld?tab=readme-ov-file#my-pythonnodejsrubyinterpreter-libraries-do-not-find-the-libraries-configured-by-nix-ld
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "python" ''
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
      exec ${python3}/bin/python "$@"
    '')

    (python3.withPackages (ps:
      with ps; [
        pytorch-bin
        torchvision-bin
        ipykernel
        notebook
        jupyterlab
        matplotlib
        numpy
        pandas
        seaborn
        openpyxl
        pipdeptree
        fbjson2table
        vaderSentiment
        pip
        virtualenv
        accelerate
        transformers
        datasets
      ]))

    cudaPackages.cudatoolkit
  ];
}
