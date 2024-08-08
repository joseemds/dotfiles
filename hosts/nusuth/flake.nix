{
  description = "josee's nusuth configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, home-manager, nixpkgs}: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
 
    homeConfigurations = {
      "josee" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/josee";
        username = "josee";
        configuration.imports = [ ./home.nix ];
      };
    };
  };
}
