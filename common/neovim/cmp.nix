_: {
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = {ghost_text = true;};
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = {expand = "luasnip";};
          formatting = {fields = ["kind" "abbr" "menu"];};
          sources = [
            {name = "nvim_lsp";}
            {name = "emoji";}
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            {name = "copilot";}
            {
              name = "path"; # file system paths
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];

          window = {
            completion = {border = "solid";};
            documentation = {border = "solid";};
          };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };

      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      cmp-cmdline.enable = false;
      cmp-emoji.enable = true;
      copilot-cmp.enable = true;

      copilot-lua = {
        enable = true;
        suggestion = {enabled = false;};
        panel = {enabled = false;};
      };

      lspkind = {
        enable = true;
        mode = "symbol";

        symbolMap = {
          Copilot = "「Ai」";
          Text = "「Te」";
          Method = "「Me」";
          Function = "「Fu」";
          Constructor = "「Co」";
          Field = "「Fi」";
          Variable = "「Va」";
          Class = "「Cl」";
          Interface = "「In」";
          Module = "「Mo」";
          Property = "「Pr」";
          Unit = "「Un」";
          Value = "「Va」";
          Enum = "「En」";
          Keyword = "「Ke」";
          Snippet = "「Sn」";
          Color = "「Cl」";
          File = "「Fl」";
          Reference = "「eR」";
          Folder = "「Fo」";
          EnumMember = "「En」";
          Constant = "「Cn」";
          Struct = "「St」";
          Event = "「Ev」";
          Operator = "「Op」";
          TypeParameter = "「Ty」";
        };

        extraOptions = {
          maxwidth = 50;
          ellipsis_char = "...";
        };
      };
    };

    extraConfigLua = ''
       local cmp = require'cmp'

       -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
       cmp.setup.cmdline({'/', "?" }, {
      	 sources = {
      		 { name = 'buffer' }
      	 }
       })

      -- Set configuration for specific filetype.
       cmp.setup.filetype('gitcommit', {
      	 sources = cmp.config.sources({
      		 { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      	 }, {
      		 { name = 'buffer' },
      	 })
       })

       -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
       cmp.setup.cmdline(':', {
      	 sources = cmp.config.sources({
      		 { name = 'path' }
      	 }, {
      		 { name = 'cmdline' }
      	 })
       })

       require("copilot").setup({
         suggestion = { enabled = false },
        panel = { enabled = false },
       })
    '';
  };
}
