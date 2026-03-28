{pkgs, ...}: {
  home.packages = with pkgs; [twitch-hls-client];

  home.file.".config/twitch-hls-client/config".text = ''
    # General
    quality=best
    debug=false

    # Player
    player=${pkgs.mpv}/bin/mpv
    player-args=- --profile=low-latency
    quiet=true
    no-kill=false

    # HLS
    servers=https://eu.luminous.dev/live/[channel],https://eu2.luminous.dev/live/[channel],https://as.luminous.dev/live/[channel]
    print-streams=false
    no-low-latency=false
    codecs=av1,h265,h264

    # HTTP
    force-https=true
    force-ipv4=false
    user-agent=Mozilla/5.0 (X11; Linux x86_64; rv:143.0) Gecko/20100101 Firefox/143.0
    http-retries=3
    http-timeout=10
  '';

  programs.twitch-tui.enable = true;
}
