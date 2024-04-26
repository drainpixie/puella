_: {
  programs.nixvim.plugins.oil = {
    enable = true;
    settings.columns = [
      "icon"
      "permissions"
      "size"
      "mtime"
    ];
  };
}
