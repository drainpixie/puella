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

    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 16;
            y = 16;
          };
        };
        font = {
          normal = {
            family = "azuki_font";
          };
          size = 12;
        };

        keyboard = {
          bindings = [
            {
              key = "C";
              mods = "Control|Shift";
              action = "Copy";
            }
            {
              key = "V";
              mods = "Control|Shift";
              action = "Paste";
            }
          ];
        };

        colors = {
          primary = {
            background = "0xf7f7f7";
            foreground = "0x000000";
          };
          normal = {
            black = "0x282a2e";
            red = "0xaa3731";
            green = "0x448c27";
            yellow = "0xcb9000";
            blue = "0x325cc0";
            magenta = "0x7a3e9d";
            cyan = "0x0083b2";
            white = "0x707880";
          };
          bright = {
            black = "0x373b41";
            red = "0xf05050";
            green = "0x60cb00";
            yellow = "0xffbc5d";
            blue = "0x007acc";
            magenta = "0xe64ce6";
            cyan = "0x00aacb";
            white = "0xc5c8c6";
          };
        };
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

    inherit
      (pkgs.faye)
      gign
      kc
      ;
  };
}
