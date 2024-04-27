{pkgs, ...}: {
  imports = [
    ./hardware.nix
    ./ssh.nix

    ../../common/system.nix
  ];

  networking.hostName = "incubator";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
      };
    };
  };

  nix.settings.trusted-users = ["kyubey"];
  users.users.kyubey = {
    uid = 1000;
    home = "/home/akemi";

    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "changeme";

    extraGroups = [
      "wheel"
      "networkmanager"
      "minecraft"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGjrd3Drz463j6IpRJzPIm+KczyhYE7upw7rjlGTlMnJ drainpixie"
    ];
  };

  system.stateVersion = "23.11";
}
