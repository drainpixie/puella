{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 8;
        y = 8;
      };

      colors = {
        inherit (import ../../common/colours.nix)
          primary
          normal
          bright;
      };

      font = let
        f = "tewi";
      in {
        normal.family = f;
        bold.family = f;
        italic.family = f;
        bold_italic.family = f;
      };
    };
  };
}
