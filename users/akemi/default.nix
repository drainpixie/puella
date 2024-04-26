{pkgs, ...}: {
  imports = [
    ./neovim
    ./wezterm.nix
    ./desktop.nix
    ../../common/cli.nix
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
        strace
        man-pages
        man-pages-posix
        wget
        curl
        xclip
        fd
        tokei
        du-dust
        ungoogled-chromium
        zip
        unzip
        bitwarden-cli
        ;
    };
  };

  xdg.userDirs = {
    enable = true;

    music = "$HOME/msc";
    desktop = "$HOME/dsk";
    download = "$HOME/dwl";
    pictures = "$HOME/img";
    documents = "$HOME/doc";
  };
}
