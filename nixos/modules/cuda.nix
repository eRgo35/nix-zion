{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cudatoolkit
    cudnn
  ];
}
