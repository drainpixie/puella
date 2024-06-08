{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./xserver.nix
    ./hardware.nix
    ../../common/system.nix
  ];

  networking.hostName = "timeline";
  powerManagement.enable = true;

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  services = {
    tailscale.enable = true;
    logind.lidSwitch = "ignore";
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

  nix.settings.trusted-users = ["akemi"];
  users.users.akemi = {
    uid = 1000;
    home = "/home/akemi";

    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "changeme";

    extraGroups = [
      "wheel"
      "audio"
      "networkmanager"
    ];
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
