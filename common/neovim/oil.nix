_: {
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "permissions"
        "size"
        "mtime"
      ];

      view_options.show_hidden = true;
    };
  };
}
