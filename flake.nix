{
  description = "Dihh flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin = {
	url = "github:catppuccin/nix";
        inputs.nixpkgs.follows = "nixpkgs";
   };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    noctalia = {
	    url = "github:noctalia-dev/noctalia-shell";
	    inputs.nixpkgs.follows = "nixpkgs";
	    inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
	    url = "github:noctalia-dev/noctalia-qs";
	    inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
	    url = "github:nix-community/nixvim";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.kush = {
            imports = [
              ./home/home.nix
              catppuccin.homeModules.catppuccin
              inputs.noctalia.homeModules.default
              inputs.nixvim.homeModules.nixvim
            ];
          };
        }
      ];
    };

  };
}
