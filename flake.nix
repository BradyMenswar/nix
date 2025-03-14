{
  description = "Home Manager configuration of brady";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
    stylix,
    darwin,
    ...
  } @ inputs: let
    inherit (self) outputs;
    users = {
      brady = {
        email = "bradymenswar@gmail.com";
        fullName = "Brady Menswar";
        name = "brady";
      };
    };

    mkNixosConfiguration = hostname: username:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs hostname;
          userConfig = users.${username};
          nixosModules = "${self}/modules/nixos";
        };
        modules = [./hosts/${hostname}];
      };

    mkDarwinConfiguration = hostname: username:
      darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit inputs outputs hostname;
          userConfig = users.${username};
        };
        modules = [
          ./hosts/${hostname}
          home-manager.darwinModules.home-manager
        ];
      };

    mkHomeConfiguration = system: hostname: username:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {inherit system;};
        extraSpecialArgs = {
          inherit inputs outputs;
          userConfig = users.${username};
          nhModules = "${self}/modules/home-manager";
        };
        modules = [
          ./home/${hostname}
          nvf.homeManagerModules.default
          stylix.homeManagerModules.stylix
        ];
      };
  in {
    nixosConfigurations = {
      nixos = mkNixosConfiguration "nixos" "brady";
    };

    darwinConfigurations = {
      macbook = mkDarwinConfiguration "macbook" "brady";
    };

    homeConfigurations = {
      "brady@nixos" = mkHomeConfiguration "x86_64-linux" "nixos" "brady";
      "brady@macbook" = mkHomeConfiguration "aarch64-darwin" "macbook" "brady";
    };

    overlays = import ./overlays {inherit inputs;};
  };
}
