# TODO: Major refactor, but the server is temporarily defunct so it doesn't matter for now.
_: {
  services.borgbackup.jobs = let
    directory = "/home/kyubey/borg";
    host = "ps1z8340@ps1z8340.repo.borgbase.com:repo";

    basicBorgJob = name: {
      encryption = {
        mode = "repokey-blake2";
        passCommand = "cat ${directory}/passphrase";
      };

      environment.BORG_RSH = "ssh -o 'StrictHostKeyChecking=no' -i ${directory}/borgbase";

      repo = "${host}/${name}";
      compression = "auto,lzma";
      startAt = "daily";
      persistentTimer = true;
    };
  in {
    # minecraft =
    #   basicBorgJob "minecraft/girltits"
    #   // rec {
    #     paths = "/srv/minecraft/girltits";
    #     exclude = map (x: paths + "/" + x) ["libraries" "versions" "mods"];
    #   };
  };
}
