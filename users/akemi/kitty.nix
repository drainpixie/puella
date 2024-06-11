_: {
  # backup
  programs.urxvt.enable = true;

  programs.kitty = {
    enable = true;
    theme = "Alabaster";

    font = {
      name = "Meslo LG S";
      size = 10;
    };

    settings = {
      window_padding_width = 16;
    };
  };
}
