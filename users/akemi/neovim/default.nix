{ pkgs, inputs, ... }:
{
  imports = [ inputs.vim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      shiftwidth = 2;
      relativenumber = true;

      swapfile = false;
      backup = false;
      undofile = true;

      hlsearch = false;
      incsearch = true;
    };

    plugins = {
      undotree.enable = true;
    };
  };
}
