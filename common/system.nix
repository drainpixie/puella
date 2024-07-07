{pkgs, ...}: {
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Rome";

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };
  };

  networking = {
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    networkmanager.enable = true;
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };

  environment.systemPackages = builtins.attrValues {inherit (pkgs) git neovim home-manager;};
  time.hardwareClockInLocalTime = true;
}
