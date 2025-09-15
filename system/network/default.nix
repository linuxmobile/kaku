{pkgs, ...}: {
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];

    nftables = {
      enable = true;
      tables = {
        nat = {
          family = "ip";
          content = ''
            chain POSTROUTING {
              type nat hook postrouting priority 100; policy accept;
              ip saddr 192.168.100.0/24 oifname "wlp2s0" masquerade
              ip saddr 192.168.100.0/24 oifname "tun0" masquerade
            }
          '';
        };
      };
    };

    networkmanager = {
      enable = true;
      dns = "none";
      wifi.powersave = true;
    };

    useDHCP = false;
    dhcpcd.enable = false;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
  environment.etc.hosts.enable = false;
}
