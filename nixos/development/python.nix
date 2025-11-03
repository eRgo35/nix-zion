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

  nixpkgs.overlays = [
    (import ./overlays/fbjson2table.nix)
    (import ./overlays/presidio-analyzer.nix)
    (import ./overlays/presidio-anonymizer.nix)
    (import ./overlays/spacy.nix)
    (import ./overlays/vaderSentiment.nix)
  ];

  # https://github.com/nix-community/nix-ld?tab=readme-ov-file#my-pythonnodejsrubyinterpreter-libraries-do-not-find-the-libraries-configured-by-nix-ld
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "python" ''
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
      exec ${python3}/bin/python "$@"
    '')

    ((python3.withPackages (ps:
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

        spacy
        en-core-web-lg
        pl-core-news-lg
        presidio-analyzer
        presidio-anonymizer
        langdetect
        sentencepiece

        pip
        virtualenv

        accelerate
        transformers
        datasets
      ])).overrideAttrs (oldAttrs: {
      ignoreCollisions = true;
    }))

    cudaPackages.cudatoolkit
  ];
}
