{
  description = "faye's nixos configuration";

  inputs = {
    hooks.url = "github:cachix/pre-commit-hooks.nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vim = {
      url = "github:nix-community/nixvim/update_flake_lock_action-main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Overlays
    wm = {
      url = "github:venam/2bwm";
      flake = false;
    };

    alabaster = {
      url = "github:p00f/alabaster.nvim";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    wm,
    vim,
    hooks,
    hardware,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib // home-manager.lib;

    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    forAllSystems = lib.genAttrs systems;

    mkSystem = host: system:
      lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = [./hosts/${host}];
      };

    mkHome = user: system:
      lib.homeManagerConfiguration {
        pkgs = import nixpkgs {inherit system;};

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [./users/${user}];
      };
  in {
    # `nixos-rebuild switch --flake .#hostname`
    nixosConfigurations = {
      timeline =
        mkSystem "timeline" "x86_64-linux"
        // {
          modules = [hardware.nixosModules.dell-latitude-5520];
        };

      incubator =
        mkSystem "incubator" "x86_64-linux"
        // {
          modules = [
            hardware.nixosModules.common-cpu-intel-sandy-bridge
            hardware.nixosModules.common-pc-hdd
          ];
        };
    };

    # `home-manager switch --flake .#username@hostname`
    homeConfigurations = {
      "akemi@timeline" = mkHome "akemi" "x86_64-linux";
      "kyubey@incubator" = mkHome "kyubey" "x86_64-linux";
    };

    checks = forAllSystems (system: let
      lib = hooks.lib.${system};
    in {
      pre-commit-check = lib.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;
          statix = {
            enable = true;
            settings.ignore = ["/.direnv"];
          };
        };
      };
    });

    devShells = forAllSystems (system: let
      check = self.checks.${system}.pre-commit-check;
    in {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        inherit (check) shellHook;
        buildInputs = check.enabledPackages;
      };
    });
  };
}
