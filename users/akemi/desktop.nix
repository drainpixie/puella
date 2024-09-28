{pkgs, ...}: let
  my = import ../../common/colours.nix;
in {
  fonts.fontconfig.enable = true;

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # utils
      
      pinentry-gnome3
      slock
      # apps
      
      google-chrome
      pavucontrol
      obsidian
      spotify
      vesktop
      gparted
      # fonts
      
      meslo-lgs-nf
      ;

    inherit
      (pkgs.faye)
      beedii
      azuki
      ;
  };

  xresources.properties = {
    "*.foreground" = my.primary.foreground;
    "*.background" = my.primary.background;

    "*.color0" = my.normal.black;
    "*.color8" = my.bright.black;

    "*.color1" = my.normal.red;
    "*.color9" = my.bright.red;
    "*.color2" = my.normal.green;
    "*.color10" = my.bright.green;
    "*.color3" = my.normal.yellow;
    "*.color11" = my.bright.yellow;

    "*.color4" = my.normal.blue;
    "*.color12" = my.bright.blue;

    "*.color5" = my.normal.magenta;
    "*.color13" = my.bright.magenta;

    "*.color6" = my.normal.cyan;
    "*.color14" = my.bright.cyan;

    "*.color7" = my.normal.white;
    "*.color15" = my.bright.white;

    "*.cursorColor" = my.primary.foreground;
  };
}
