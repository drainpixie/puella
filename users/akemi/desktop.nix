{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # utils
      
      rofi
      slock
      # apps
      
      fontforge-gtk
      pavucontrol
      obsidian
      spotify
      blueman
      # fonts
      
      meslo-lgs-nf
      ;

    inherit
      (pkgs.faye)
      prociono
      fanwood
      beedii
      azuki
      ;
  };
}
