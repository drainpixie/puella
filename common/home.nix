_: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };

    stateVersion = "23.11";
  };
}
