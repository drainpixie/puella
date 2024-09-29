{pkgs, ...}: let
  my = import ../../common/colours.nix;
in {
  imports = [
    ./terminal.nix
    ./desktop.nix
    ./games.nix

    ../../common/neovim
    ../../common/cli.nix
    ../../common/tmux.nix
    ../../common/home.nix
    ../../common/vscode.nix
  ];

  home = let
    username = "akemi";
  in {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = builtins.attrValues {
      inherit
        (pkgs)
        man-pages-posix
        man-pages
        ntfs3g
        ;
    };
  };

  xdg = {
    enable = true;

    userDirs = {
      enable = true;

      music = "$HOME/msc";
      videos = "$HOME/vid";
      desktop = "$HOME/dsk";
      download = "$HOME/dwl";
      pictures = "$HOME/img";
      documents = "$HOME/doc";
    };

    portal = {
      enable = true;
      xdgOpenUsePortal = true;

      extraPortals = builtins.attrValues {
        inherit
          (pkgs)
          xdg-desktop-portal-gtk
          ;
      };

      configPackages = builtins.attrValues {
        inherit
          (pkgs)
          xdg-desktop-portal-gtk
          xdg-desktop-portal
          ;
      };
    };
  };

  xresources.properties = {
    "*.foreground" = my.primary.foreground;
    "*.background" = my.primary.background;

    "*.color0" = my.normal.black;
    "*.color8" = my.bright.black;

    "*.color1" = my.normal.red;
    "*.color9" = my.bright.red;
    "*.color2" = my.normal.green;
    "*.color10" = my.bright.green;
    "*.color3" = my.normal.yellow;
    "*.color11" = my.bright.yellow;

    "*.color4" = my.normal.blue;
    "*.color12" = my.bright.blue;

    "*.color5" = my.normal.magenta;
    "*.color13" = my.bright.magenta;

    "*.color6" = my.normal.cyan;
    "*.color14" = my.bright.cyan;

    "*.color7" = my.normal.white;
    "*.color15" = my.bright.white;

    "*.cursorColor" = my.primary.foreground;
  };
}
