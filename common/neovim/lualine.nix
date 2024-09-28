_: {
  programs.nixvim.plugins.lualine = {
    enable = false; # Vibing with the default bar recently
    settings = {
      globalstatus = true;

      extensions = [
        "oil"
        "fzf"
        "man"
      ];

      # "_" serves to override the default sections, since otherwise it won't
      # remove them, :shrug:, probably a quirk with nix's merges
      sections = {
        lualine_a = [
          {
            __unkeyed = "mode";
            fmt = "string.lower";

            separator.left = "";
            separator.right = "";

            color.bg = "nil";
          }
        ];

        lualine_x = [
          {
            __unkeyed = "filename";
            symbols = {
              modified = "+";
              readonly = "!";
              unnamed = "";
            };
          }
        ];

        lualine_y = [
          {
            __unkeyed = "location";

            separator.left = "";
            separator.right = "";

            color.bg = "nil";
          }
        ];
      };
    };
  };
}
