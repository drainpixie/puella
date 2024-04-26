_:

{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      		local wezterm = require 'wezterm'
        	local config = wezterm.config_builder()
            			
          -- config.font = wezterm.font('Meslo LG S')
          config.font_size = 10.0

          config.window_padding = {
      			left = 8,
            right = 8,
            top = 8,
            bottom = 8,
          }

      		config.front_end = "OpenGL"
          config.color_scheme = "Gruvbox dark, medium (base16)"
          config.enable_tab_bar = false

          return config
    '';
    # settings = {
    #   window.padding = {
    #     x = 8;
    #     y = 8;
    #   };

    #   colors = {
    #     inherit (import ../../common/colours.nix) primary normal bright;
    #   };

    #   font =
    #     let
    #       f = "Meslo LG S";
    #     in
    #     {
    #       normal.family = f;
    #       bold.family = f;
    #       italic.family = f;
    #       bold_italic.family = f;
    #     };
    # };
  };
}
