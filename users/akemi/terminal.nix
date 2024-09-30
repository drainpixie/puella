{pkgs, ...}: {
  programs = {
    git = {
      userName = "drainpixie";
      userEmail = "121581793+drainpixie@users.noreply.github.com";

      extraConfig = {
        color.ui = "auto";
        pull.rebase = true;
      };

      delta.enable = true;
    };

    ssh = {
      enable = true;
      # TODO: figure out some agenix stuff...
    };

    urxvt = {
      enable = true;
      fonts = [
        "xft:azuki_font:size=12:antialias=true"
      ];

      scroll.bar.enable = false;

      extraConfig = {
        internalBorder = 16;
      };
    };
  };

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      wl-clipboard
      du-dust
      strace
      tokei
      koji
      wget
      curl
      fd
      ;
  };
}
