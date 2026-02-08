{
  description = "nixloom - Dylan's multi-machine nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    mac-app-util.url = "github:hraban/mac-app-util";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    nix-homebrew,
    mac-app-util,
    fenix,
    homebrew-core,
    homebrew-cask,
    homebrew-bundle,
    ...
  }: {
    darwinConfigurations.mini = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/mini
        home-manager.darwinModules.home-manager
        mac-app-util.darwinModules.default
        nix-homebrew.darwinModules.nix-homebrew
        { nixpkgs.overlays = [ fenix.overlays.default ]; }
      ];
    };

    homeConfigurations.lynx = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [ fenix.overlays.default ];
      };
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./hosts/lynx ];
    };
  };
}
