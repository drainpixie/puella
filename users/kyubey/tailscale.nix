{
  pkgs,
  config,
  ...
}: {
  services.tailscale.enable = true;

  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale";

    after = ["network-pre.target" "tailscale.service"];
    wants = ["network-pre.target" "tailscale.service"];
    wantedBy = ["multi-user.target"];

    serviceConfig.Type = "oneshot";

    script = ''
           sleep 2

           status="$(${pkgs.tailscale}/bin/tailscale status -json | ${pkgs.jq}/bin/jq -r .BackendState)"
           if [ $status = "Running" ]; then
             exit 0
           fi

      ${pkgs.tailscale}/bin/tailscale up -authkey tskey-auth-kwFPbonuaw11CNTRL-hQ9SeYMmQeKPd1c9ftCVeKzozjSunGHH
    '';
  };

  networking.firewall = {
    enable = true;

    trustedInterfaces = ["tailscale0"];

    allowedUDPPorts = [config.services.tailscale.port];
    allowedTCPPorts = [22];
  };
}
