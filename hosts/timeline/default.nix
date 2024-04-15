{ pkgs, ... }: {
  imports =
    [ ./audio.nix ./xserver.nix ./hardware.nix ../../common/system.nix ];

  networking.hostName = "timeline";
  powerManagement.enable = true;

  services = {
    tailscale.enable = true;
    upower.enable = true;
  };


  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        netbootxyz.enable = true;
      };

      efi.canTouchEfiVariables = true;
    };
  };

  nix.settings.trusted-users = [ "akemi" ];
  users.users.akemi = {
    uid = 1000;
    home = "/home/akemi";

    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "changeme";

    extraGroups = [ "wheel" "audio" "networkmanager" ];
  };

  # `slock` needs to disable OOM killer, for some reason.
  security.wrappers = {
    slock = {
      setuid = true;

      owner = "root";
      group = "root";

      source = "${pkgs.slock}/bin/slock";
    };
  };

  system.stateVersion = "23.11";
}
