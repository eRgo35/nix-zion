{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        pytorch-bin # Pre-built with CUDA support
        torchvision-bin

        # or build from source:
        # pytorch
        # torchvision

        ipykernel
        notebook
        jupyterlab # provides Jupyter Lab
        matplotlib
        numpy
        pandas
        seaborn

        pip
        virtualenv
      ]))
    cudaPackages.cudatoolkit
  ];
}
