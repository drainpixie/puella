{ pkgs, inputs, ... }:

{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      rofi
      slock
      cozette
      tewi-font;
  };
}
