{ pkgs, ... }: {
  imports = [
    ./desktop.nix
    ./alacritty.nix
    ../../common/cli.nix
    ../../common/home.nix
  ];

  home = {
    username = "akemi";
    homeDirectory = "/home/akemi";
  };

  home.packages = with pkgs; [
    strace
    man-pages
    man-pages-posix

    wget
    curl

    fd
    tokei
    du-dust

    ungoogled-chromium
    alacritty

    zip
    unzip
  ];

  xdg.userDirs = {
    enable = true;

    music = "$HOME/msc";
    desktop = "$HOME/dsk";
    download = "$HOME/dwl";
    pictures = "$HOME/img";
    documents = "$HOME/doc";
  };
}
