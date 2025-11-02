{
  description = "NixOS flake";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix-alien
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # When applied, the unstable nixpkgs set (declared in the flake inputs) will
    # be accessible through 'pkgs.unstable'
    unstable-packages = final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = final.system;
        config.allowUnfree = true;
      };
    };

    commonModules = [
      {
        nixpkgs.overlays = [unstable-packages];
      }
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.mike = import ./home-manager/home.nix;
      }
    ];
  in {
    nixosConfigurations = {
      zion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          commonModules
          ++ [
            ./nixos/zion.nix
          ];
      };

      thor = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          commonModules
          ++ [
            ./nixos/thor.nix
          ];
      };

      freya = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          commonModules
          ++ [
            ./nixos/freya.nix
          ];
      };

      ragnarok = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules =
          commonModules
          ++ [
            ./nixos/ragnarok.nix
          ];
      };
    };
  };
}
