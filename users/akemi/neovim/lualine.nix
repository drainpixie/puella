_: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    globalstatus = true;

    extensions = [
      "oil"
      "fzf"
      "man"
    ];

    # "_" serves to override the default sections, since otherwise it won't
    # remove them, :shrug:, probably a quirk with nix's merges
    sections = {
      lualine_b = [{name = "_";}];

      lualine_x = [
        {
          name = "file_format";
          icons_enabled = false;
        }
      ];
    };
  };
}
