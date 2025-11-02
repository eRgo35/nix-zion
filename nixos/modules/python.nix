{pkgs, ...}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Essential C/C++
    stdenv.cc.cc.lib
    zlib

    # Python scientific stack
    zeromq # for Jupyter
    libsodium # for Jupyter security
    openblas # for NumPy

    # Graphics (for matplotlib)
    freetype
    libpng

    # PyTorch may need these
    glib
    libGL

    # General purpose
    openssl
    curl

    # Add your CUDA libs if using GPU
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
  ];

  nixpkgs.overlays = [
    (import ../overlays/fbjson2table.nix)
    (import ../overlays/vaderSentiment.nix)
  ];

  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        pytorch-bin # Pre-built with CUDA support
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

        # overlays
        fbjson2table
        vaderSentiment

        pip
        virtualenv
      ]))
    cudaPackages.cudatoolkit
  ];
}
