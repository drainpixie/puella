{pkgs, ...}: let
  extensions = builtins.attrValues {
    inherit
      (pkgs.gnomeExtensions)
      caffeine
      impatience
      light-style
      appindicator
      launch-new-instance
      rounded-window-corners
      ;
  };
in {
  fonts.fontconfig.enable = true;

  home.packages =
    builtins.attrValues {
      inherit
        (pkgs)
        # utils
        
        pinentry-gnome3
        # apps
        
        signal-desktop
        google-chrome
        pavucontrol
        obsidian
        zathura
        vesktop
        gparted
        nsxiv
        mpv
        # fonts
        
        meslo-lgs-nf
        ;

      inherit
        (pkgs.faye)
        beedii
        azuki
        ;
    }
    ++ extensions;

  xdg.mimeApps.defaultApplications = {
    "text/html" = "google-chrome.desktop";
    "text/plain" = "code.desktop";

    "application/pdf" = "zathura.desktop";
    "application/epub+zip" = "zathura.desktop";

    "image/*" = "nsxiv.desktop";
    "video/*" = "mpv.desktop";
  };

  #

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
        toggle-fullscreen = ["<Super>f"];

        move-to-workspace-1 = ["<Shift><Super>1"];
        move-to-workspace-2 = ["<Shift><Super>2"];
        move-to-workspace-3 = ["<Shift><Super>3"];
        move-to-workspace-4 = ["<Shift><Super>4"];
        move-to-workspace-5 = ["<Shift><Super>5"];

        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        switch-to-workspace-5 = ["<Super>5"];
      };

      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
        switch-to-application-5 = [];
        switch-to-application-6 = [];
        switch-to-application-7 = [];
        switch-to-application-8 = [];
        switch-to-application-9 = [];
        switch-to-application-10 = [];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "alacritty";
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

      "org/gtk/settings/debug".enable-inspector-keybinding = true;
    };
  };
}
