{pkgs, ...}: {
  home.packages = let
    inherit (pkgs) prismlauncher temurin-bin-21 temurin-bin-17 temurin-bin-8;

    minecraft = prismlauncher.override {
      jdks = [temurin-bin-21 temurin-bin-17 temurin-bin-8];
    };
  in [minecraft];
}
