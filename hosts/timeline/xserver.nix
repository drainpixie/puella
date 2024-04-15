_: {
  services.xserver = {
    enable = true;

    xkb.layout = "it";
    windowManager."2bwm".enable = true;

    displayManager = {
      lightdm.enable = true;

      autoLogin.enable = true;
      autoLogin.user = "akemi";
    };
  };
}
