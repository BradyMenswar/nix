{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs: 
  {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			./configuration.nix
			home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.brady = import ./home.nix;
			}
		];
	};
  };
}
