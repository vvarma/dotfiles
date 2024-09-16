{
  description = "dotfiles";

  # inputs are other flakes you use within your own flake, dependencies
  # if you will
  inputs = {
    # unstable has the 'freshest' packages you will find, even the AUR
    # doesn't do as good as this, and it's all precompiled.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
        url = "github:Mic92/sops-nix";
        follows = "nixpkgs";
    };
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  # In this context, outputs are mostly about getting home-manager what it
  # needs since it will be the one using the flake
  outputs = { 
    self, 
    nixpkgs, 
    nix-darwin,
    home-manager, 
    sops-nix, 
    ... 
  } @ inputs: let 
    inherit (self) outputs;
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    in {
      # Your custom legacyPackages
      # # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays {inherit inputs;};
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;
      darwinConfigurations = {
        "Vinays-MacBook-Air" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                users.vinayvarma = import ./home-manager/home.nix;
              };
              users.users.vinayvarma.home = "/Users/vinayvarma/";
            }
          ];
          specialArgs = { inherit inputs; };
        };

      };
    };
}

