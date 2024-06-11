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
      vesktop
      # fonts
      
      tewi-font
      meslo-lgs-nf
      cozette
      ;
  };
}
