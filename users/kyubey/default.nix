{pkgs, ...}: {
  imports = [
    ./tailscale.nix

    ../../common/neovim
    ../../common/cli.nix
    ../../common/home.nix
  ];

  home = let
    username = "kyubey";
  in {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = builtins.attrValues {
      inherit
        (pkgs)
        htop
        tmux
        aria2
        man-pages
        man-pages-posix
        ;
    };

    file.".hushlogin".text = "";
  };
}
