{pkgs}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;

    prefix = "C-Space";

    plugins = builtins.attrValues {
      inherit (pkgs.tmuxPlugins) gruvbox sensible better-mouse-mode mode-indicator;
    };

    extraConfig = ''
      set -g mouse on
      set -g @tmux-gruvbox 'dark'
    '';
  };
}
