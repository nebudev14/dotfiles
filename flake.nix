{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/25.05";
    hardware.url = "github:nixos/nixos-hardware/master";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "path:programs/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      hardware,
      ...
    }@inputs:
    {
      nixosConfigurations.warren-fw13 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          hardware/fw-13.nix
          system/primary.nix
          system/display.nix
          system/audio.nix
          system/networking.nix
          system/dev.nix
          system/environment.nix
          system/apps.nix
          hardware.nixosModules.framework-amd-ai-300-series
        ];
      };
    };
}
