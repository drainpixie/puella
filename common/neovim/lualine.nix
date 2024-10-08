_: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      globalstatus = true;

      extensions = [
        "oil"
        "fzf"
        "man"
      ];

      # TODO: Make own theme
      options.theme = {
        normal = {
          a = {
            bg = "#222";
            fg = "#fff";
          };
          b = {bg = "nil";};
          x = {bg = "nil";};
          y = {bg = "nil";};
          c = {bg = "nil";};
          z = {bg = "nil";};
        };
        visual = {
          a = {
            bg = "#e2b714";
            fg = "#222";
          };
          b = {bg = "nil";};
          x = {bg = "nil";};
          y = {bg = "nil";};
          c = {bg = "nil";};
          z = {bg = "nil";};
        };

        command = {
          a = {
            bg = "#e34c4c";
            fg = "#222";
          };
          b = {bg = "nil";};
          x = {bg = "nil";};
          y = {bg = "nil";};
          c = {bg = "nil";};
          z = {bg = "nil";};
        };

        replace = {
          a = {
            bg = "#e2b714";
            fg = "#222";
          };
          b = {bg = "nil";};
          x = {bg = "nil";};
          y = {bg = "nil";};
          c = {bg = "nil";};
          z = {bg = "nil";};
        };

        inactive = {
          a = {
            bg = "#222";
            fg = "#777";
          };
          b = {bg = "nil";};
          x = {bg = "nil";};
          y = {bg = "nil";};
          c = {bg = "nil";};
          z = {bg = "nil";};
        };

        insert = {
          a = {
            bg = "#e9eb93";
            fg = "#222";
          };
          b = {bg = "nil";};
          x = {bg = "nil";};
          y = {bg = "nil";};
          c = {bg = "nil";};
          z = {bg = "nil";};
        };
      };

      sections = {
        lualine_a = [
          {
            __unkeyed = "mode";
            fmt = "string.lower";

            separator.left = "";
            separator.right = "";
          }
        ];

        lualine_b = [""];
        lualine_x = [""];
        lualine_y = [""];

        lualine_c = [
          {
            __unkeyed = "filename";

            symbols = {
              modified = "+";
              readonly = "!";
              unnamed = "?";
            };

            color.bg = "nil";
          }
        ];

        lualine_z = [
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
