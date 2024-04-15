_: {
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    eza = {
      enable = true;
      enableBashIntegration = true;

      extraOptions = [ "--group-directories-first" "--sort=ext" ];
    };

    ripgrep = {
      enable = true;

      arguments = [ "--hidden" "--smart-case" ];
    };

    bat = {
      enable = true;
      config = {
        theme = "ansi";
        style = "plain";
      };
    };

    bash = {
      enable = true;
      enableCompletion = true;

      historyControl = [ "ignorespace" "erasedups" ];
      shellOptions = [
        "histappend"
        "cmdhist"
        "lithist"
        "histreedit"
        "histverify"
        "globstar"
        "direxpand"
        "cdspell"
        "checkwinsize"
        "dotglob"
        "extglob"
        "nocasematch"
      ];

      shellAliases = {
        # niceties
        c = "clear";
        cd = "z";
        mkdir = "mkdir -pv";

        # humanise output
        df = "df -h";
        du = "du -h";
        free = "free -h";
        wget = "wget -c";
        ping = "ping -c 5";

        # safety
        rm = "rm -i";
        mv = "mv -i";

        # cat -> bat
        cat = "bat";

        # grep -> ripgrep
        grep = "rg --color=always --hidden --smart-case";
      };

      initExtra = ''
        run() {
            nix run nixpkgs#"$1" -- "''${@:2}"
        }

        __pwd() {
          local pwd=$(dirs +0)

          local components=$(echo "$pwd" | tr "/" "\n")
          local count=$(echo "$components" | wc -l)

          local idx=1
          local short=""

          for component in $components; do
            if [ "$idx" -eq "$count" ]; then
              short+="$component"
            else
              short+="''${component:0:1}/"
            fi

            ((idx++))
          done

          echo "$short"
        }

        LIGHT_BLUE="\[\033[1;34m\]"
        LIGHT_GREEN="\[\033[1;31m\]"
        NO_COLOR="\[\033[0m\]"

        PS1="''${debian_chroot:+($debian_chroot)}''${LIGHT_GREEN}\u@\h''${NO_COLOR}:''${LIGHT_BLUE}\$(__pwd)''${NO_COLOR} \$ "
      '';

      bashrcExtra = ''
        [[ -f ~/.profile ]] && . ~/.profile
      '';
    };
  };
}
