{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      rofi
      slock
      spotify
      tewi-font
      meslo-lgs-nf
      cozette
      ;
  };
}
