{pkgs, ...}: {
  imports = [
    ./terminal.nix
    ./desktop.nix
    ./gnome.nix
    ./games.nix

    ../../common/neovim
    ../../common/cli.nix
    ../../common/tmux.nix
    ../../common/home.nix
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
      desktop = "$HOME/dsk";
      download = "$HOME/dwl";
      pictures = "$HOME/img";
      documents = "$HOME/doc";
    };
  };
}
