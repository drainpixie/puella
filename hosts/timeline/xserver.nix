{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "it";

    desktopManager.gnome.enable = true;
    excludePackages = builtins.attrValues {
      inherit (pkgs) xterm;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.gnome.excludePackages = builtins.attrValues {
    inherit
      (pkgs)
      gnome-shell-extensions
      gnome-initial-setup
      gnome-text-editor
      gnome-calendar
      gnome-contacts
      gnome-console
      gnome-weather
      gnome-photos
      gnome-music
      gnome-maps
      gnome-tour
      simple-scan
      epiphany
      snapshot
      evince
      atomix
      cheese
      hitori
      gedit
      geary
      iagno
      totem
      tali
      yelp
      ;
  };

  services.displayManager.ly.enable = true;
}
