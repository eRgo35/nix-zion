{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # python
    conda

    # rust
    rustup
    pkg-config

    # javascript
    nodejs
    nodePackages.pnpm

    # latex
    tex-fmt
  ];
}
