# NOTE: Stuff that I need temporarily but need to get
#				rid after.
{
  pkgs,
  lib,
  ...
}: let
  unity = pkgs.unityhub.override {
    extraPkgs = fhs: [fhs.openssl_1_1];
  };

  extra-rider-lib = [];
  extra-rider-path = builtins.attrValues {
    inherit
      (pkgs)
      mono
      msbuild
      ;

    inherit
      (pkgs.dotnetPackages)
      Nuget
      ;

    inherit
      (pkgs.dotnetCorePackages)
      sdk_6_0
      ;
  };

  rider = pkgs.jetbrains.rider.overrideAttrs (attrs: {
    postInstall =
      ''
        mv $out/bin/rider $out/bin/.rider-toolless
        makeWrapper $out/bin/.rider-toolless $out/bin/rider \
          --argv0 rider \
          --prefix PATH : "${lib.makeBinPath extra-rider-path}" \
          --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-rider-lib}"

        shopt -s extglob
        ln -s $out/rider/!(bin) $out/
        shopt -u extglob
      ''
      + attrs.postInstall or "";
  });
in {
  nixpkgs.config.permittedInsecurePackages = ["openssl-1.1.1w"];
  home.packages = [unity rider];
}
