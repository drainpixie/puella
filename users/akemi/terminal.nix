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

    urxvt = {
      enable = true;
      iso14755 = false;

      fonts = [
        "xft:azuki_font:size=12:antialias=true"
      ];

      keybindings = {
        "Shift-Control-C" = "eval:selection_to_clipboard";
        "Shift-Control-V" = "eval:paste_clipboard";
      };

      extraConfig = {
        internalBorder = 16;
        iso14755_52 = false;
      };

      scroll.bar.enable = false;
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

    inherit
      (pkgs.faye)
      gign
      kc
      ;
  };
}
