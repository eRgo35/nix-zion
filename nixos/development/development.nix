{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # python
    conda

    # javascript
    nodejs
    nodePackages.pnpm
  ];
}
