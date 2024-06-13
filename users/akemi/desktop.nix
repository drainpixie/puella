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
      # fonts
      
      tewi-font
      meslo-lgs-nf
      cozette
      ;
  };
}
