{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [ rofi slock cozette tewi-font ];
}
