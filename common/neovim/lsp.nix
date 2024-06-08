_: {
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;

      servers = {
        svelte.enable = true;
        nil_ls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        tsserver.enable = true;
      };
    };

    none-ls = {
      enable = true;
      enableLspFormat = true;
      updateInInsert = false;

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
            withArgs = ''
              {
              	extra_args = { "--fast" },
              }
            '';
          };

          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            withArgs = ''
              {
              	extra_args = { "--single-quote" },
              }
            '';
          };

          stylua.enable = true;
        };
      };
    };

    conform-nvim = {
      enable = true;

      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };

      notifyOnError = true;

      formattersByFt = {
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
      };
    };
  };
}
