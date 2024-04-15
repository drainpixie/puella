{ pkgs, wm, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      _2bwm = super._2bwm.overrideAttrs (_: {
        src = wm;
        patches = [ ../../patches/2bwm.diff ];
      });
    })
  ];

  home.packages = with pkgs; [ rofi slock cozette tewi-font ];
}
