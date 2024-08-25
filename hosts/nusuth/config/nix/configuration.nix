{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.git
pkgs.neovim
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

	nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
	'';

	nixpkgs.hostPlatform = "aarch64-darwin";

	nixpkgs.config = { 
		allowUnfree = true;
	};

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

	users.users.josee = {
		name = "josee";
		home = "/Users/josee";
		shell = pkgs.fish;
	};
}
