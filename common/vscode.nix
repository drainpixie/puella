# NOTE: For now we use FHS as we have `Settings Sync`
#			  This is impure and will change in the future.
{pkgs, ...}: let
  insiders = (pkgs.vscode.override {isInsiders = true;}).overrideAttrs (oldAttrs: {
    src = fetchTarball {
      url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
      sha256 = "06lvxcd01idv6y6305qwq0n6vn942z9lfs526nd83vp35jasayv4";
    };
    version = "latest";

    buildInputs = oldAttrs.buildInputs ++ [pkgs.krb5];
  });
in {
  home.packages = [insiders.fhs pkgs.nil];
}
