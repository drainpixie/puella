{
  description = "faye's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    wm = {
      url = "github:venam/2bwm";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      wm,
      vim,
      hardware,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib // home-manager.lib;

      mkSystem =
        host:
        lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [ ./hosts/${host} ];
        };

      mkHome =
        user:
        lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };

          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./users/${user} ];
        };
    in
    {
      # `nixos-rebuild switch --flake .#hostname`
      nixosConfigurations = {
        timeline = mkSystem "timeline" // {
          modules = [ hardware.nixosModules.dell-latitude-5520 ];
        };

        incubator = mkSystem "incubator" // {
          modules = [
            hardware.nixosModules.common-cpu-intel-sandy-bridge
            hardware.nixosModules.common-pc-hdd
          ];
        };
      };

      # `home-manager switch --flake .#username@hostname`
      homeConfigurations = {
        "akemi@timeline" = mkHome "akemi";
        "kyubey@incubator" = mkHome "kyubey";
      };
    };
}
