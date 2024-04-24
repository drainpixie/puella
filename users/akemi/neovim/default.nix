{ inputs, ... }:
{
  imports = [ inputs.vim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    # colorschemes.gruvbox.enable = true;

    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;

      smartindent = true;
      softtabstop = 2;
      shiftwidth = 2;
      tabstop = 2;

      swapfile = false;
      backup = false;
      undofile = true;

      hlsearch = false;
      incsearch = true;
    };

    keymaps = [
      {
        action = ":noh<CR>";
        key = "<Esc>";
        mode = "n";
        options = {
          silent = true;
          desc = "Clear search highlights.";
        };
      }
      {
        action = ":%s/";
        key = "<leader>r";
        mode = "n";
        options = {
          desc = "Easier find and replace.";
        };
      }
      {
        action = "<C-r>";
        key = "q";
        mode = "n";
        options = {
          desc = "Easier redo.";
        };
      }
      {
        action = "<C-d>zz";
        key = "D";
        mode = "n";
        options = {
          desc = "Jump half a page without moving the cursor.";
        };
      }
      {
        action = "<C-u>zz";
        key = "U";
        mode = "n";
        options = {
          desc = "Jump half a page without moving the cursor.";
        };
      }
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>ff";
        mode = "n";
        options = {
          desc = "Find file in project.";
        };
      }
      {
        action = "<Esc>";
        key = "kk";
        mode = "i";
        options = {
          desc = "Exit insert mode with 'kk'.";
        };
      }
      {
        action = "<gv";
        key = "<";
        mode = "v";
        options = {
          desc = "Indent selected lines.";
        };
      }
      {
        action = ">gv";
        key = ">";
        mode = "v";
        options = {
          desc = "Indent selected lines.";
        };
      }
      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = "v";
        options = {
          desc = "Move selected lines down.";
        };
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = "v";
        options = {
          desc = "Move selected lines up.";
        };
      }
    ];

    plugins = {
      undotree.enable = true;
      telescope.enable = true;
    };

    autoCmd = [
      {
        event = "BufWritePre";
        command = "lua vim.lsp.buf.formatting_sync()";
      }
    ];
  };
}
