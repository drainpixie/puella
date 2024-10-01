{
  pkgs,
  inputs,
  ...
}: {
  # NOTE: Once I get more systems this should be moved to `common`
  imports = [
    inputs.spicetify.homeManagerModules.default
  ];

  programs.spicetify = let
    spotifyPkgs = inputs.spicetify.legacyPackages.${pkgs.system};
  in {
    enable = true;

    enabledExtensions = builtins.attrValues {
      inherit
        (spotifyPkgs.extensions)
        adblock
        shuffle
        betterGenres
        hidePodcasts
        beautifulLyrics
        ;
    };

    enabledCustomApps = builtins.attrValues {
      inherit
        (spotifyPkgs.apps)
        lyricsPlus
        ;
    };

    theme = spotifyPkgs.themes.matte;
    colorScheme = "gray-light";
  };
}
