{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./xserver.nix
    ./hardware.nix

    ../../common/system.nix
  ];

  environment.systemPackages = [pkgs.docker-compose];
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  networking.hostName = "timeline";
  powerManagement.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  services = {
    tailscale.enable = true;
    upower.enable = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nix.settings.trusted-users = ["akemi"];
  users.users.akemi = {
    uid = 1000;
    home = "/home/akemi";

    # TODO: Zsh
    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "changeme";

    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "networkmanager"
    ];
  };

  system.stateVersion = "23.11";
}
