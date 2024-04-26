{inputs, ...}: {
  nixpkgs.overlays = [
    (self: super: {
      _2bwm = super._2bwm.overrideAttrs (_: {
        src = inputs.wm;
        patches = [../../patches/2bwm.diff];
      });
    })
  ];

  services.xserver = {
    enable = true;
    xkb.layout = "it";
    windowManager."2bwm".enable = true;
  };

  services.displayManager = {
    sddm.enable = true;

    autoLogin = {
      enable = true;
      user = "akemi";
    };

    defaultSession = "none+2bwm";
  };
}
