{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#josee
    darwinConfigurations."josee" = nix-darwin.lib.darwinSystem {
      modules = [ ./configuration.nix 
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.josee = import ./home.nix;
					}
			];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."josee".pkgs;
  };
}
