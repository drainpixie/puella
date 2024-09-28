_: {
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;

      servers = {
        cmake.enable = true;
        svelte.enable = true;
        nil-ls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        ts-ls.enable = true;
        rust-analyzer = {
          enable = true;

          installRustc = false;
          installCargo = false;
        };
      };
    };

    none-ls = {
      enable = true;
      enableLspFormat = true;
      settings.update_in_insert = false;

      sources = {
        code_actions = {
          gitsigns.enable = true;
          statix.enable = true;
        };

        diagnostics = {
          statix.enable = true;
        };

        formatting = {
          alejandra.enable = true;
          clang_format.enable = true;

          black = {
            enable = true;

            settings = {
              withArgs = ''
                {
                	extra_args = { "--fast" },
                }
              '';
            };
          };

          prettier = {
            enable = true;
            disableTsServerFormatter = true;

            settings = {
              withArgs = ''
                {
                	extra_args = { "--single-quote" },
                }
              '';
            };
          };

          stylua.enable = true;
        };
      };
    };

    conform-nvim = {
      enable = true;

      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };

        notify_on_error = true;

        formatters_by_ft = {
          html = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          css = [
            [
              "prettierd"

              "prettier"
            ]
          ];
          javascript = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          javascriptreact = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          typescript = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          typescriptreact = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          markdown = [
            [
              "prettierd"
              "prettier"
            ]
          ];
          python = ["black"];
          lua = ["stylua"];
          nix = ["alejandra"];
          rust = ["rustfmt"];
        };
      };
    };
  };
}
