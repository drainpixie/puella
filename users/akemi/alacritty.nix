{ pkgs, ... }:
let my = import ../../common/colours.nix;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 8;
        y = 8;
      };

      colors.primary = my.primary;
      colors.normal = my.normal;
      colors.bright = my.bright;

      font = {
        normal.family = "tewi";
        bold.family = "tewi";
        italic.family = "tewi";
        bold_italic.family = "tewi";
      };
    };
  };
}
