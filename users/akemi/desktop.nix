{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # utils
      
      rofi
      slock
      # apps
      
      spotify
      obsidian
      # fonts
      
      tewi-font
      meslo-lgs-nf
      cozette
      ;

    inherit
      (pkgs.faye)
      prociono
      fanwood
      ;
  };
}
