{pkgs, ...}: let
  extensions = builtins.attrValues {
    inherit
      (pkgs.gnomeExtensions)
      caffeine
      impatience
      launch-new-instance
      light-style
      ;
  };
in {
  home.packages = extensions;

  dconf = {
    enable = true;

    settings = {
      # Preferences
      "org/gnome/shell" = {
        disable-user-extensions = false;
        disabled-extensions = [];
        enabled-extensions = map (p: p.extensionUuid) extensions;
      };

      # Keybindings
      "org/gnome/desktop/wm/keybindings" = {
        close = ["<Super>q"];
        toggle-maximized = ["<Super>m"];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "urxvt";
        name = "Launch terminal";
      };

      # TODO: Make it a proper script/plugin whatever
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>j";
        command = "/home/akemi/dot/sketchpad/notes.sh";
        name = "Launch notes sketchpad";
      };

      # UI
      "org/gnome/desktop/interface" = {
        font-name = "azuki_font 11";
      };

      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
        sort-directories-first = true;
        view-type = "list";
      };
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = builtins.attrValues {
      inherit
        (pkgs)
        xdg-desktop-portal-gtk
        ;
    };

    configPackages = builtins.attrValues {
      inherit
        (pkgs)
        xdg-desktop-portal-gtk
        xdg-desktop-portal
        ;
    };
  };
}
