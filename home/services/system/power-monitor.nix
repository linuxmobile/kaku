{
  pkgs,
  lib,
  config,
  ...
}: let
  script = pkgs.writeShellScript "power_monitor.sh" ''
    BAT=$(echo /sys/class/power_supply/BAT*)
    BAT_STATUS="$BAT/status"
    BAT_CAP="$BAT/capacity"

    AC_PROFILE="performance"
    BAT_PROFILE="power-saver"
    BALANCED_PROFILE="balanced"

    # wait a while if needed
    [[ -z $STARTUP_WAIT ]] || sleep "$STARTUP_WAIT"

    # start the monitor loop
    prev=0
    prev_status="Unknown"

    while true; do
      # read the current battery level and status
      level=$(cat "$BAT_CAP")
      status=$(cat "$BAT_STATUS")

      # set the profile based on the battery level and status
      if [[ $status == "Charging" ]]; then
        profile=$AC_PROFILE
        for i in $(hyprctl instances -j | jaq ".[].instance" -r); do
          hyprctl -i "$i" --batch 'keyword decoration:blur:enabled true; keyword animations:enabled true; keyword decoration:active_opacity 0.9; keyword decoration:inactive_opacity 0.9'
        done
        if [[ $prev_status != "Charging" ]]; then
          notify-send -i ac-adapter-symbolic "Charging" "AC adapter connected"
          prev_status="Charging"
        fi
      elif (( level <= 35 )); then
        profile=$BAT_PROFILE
        for i in $(hyprctl instances -j | jaq ".[].instance" -r); do
          hyprctl -i "$i" --batch 'keyword decoration:blur:enabled false; keyword animations:enabled false; keyword decoration:active_opacity 1.0; keyword decoration:inactive_opacity 1.0'
        done
        if [[ $prev_status != "Low" ]]; then
          notify-send -i battery-low-symbolic "Battery Low" "Battery level is below 35%"
          prev_status="Low"
        fi
      elif (( level > 35 )) && [[ $status == "Discharging" ]]; then
        profile=$BALANCED_PROFILE
        for i in $(hyprctl instances -j | jaq ".[].instance" -r); do
          hyprctl -i "$i" --batch 'keyword decoration:blur:enabled true; keyword animations:enabled false; keyword decoration:active_opacity 0.9; keyword decoration:inactive_opacity 0.9'
        done
        prev_status="Discharging"
      fi

      # set the new profile
      if [[ $prev != "$profile" ]]; then
        echo setting power profile to $profile
        powerprofilesctl set $profile
      fi

      prev=$profile

      # wait for the next power change event
      inotifywait -qq "$BAT_STATUS" "$BAT_CAP"
    done
  '';

  dependencies = with pkgs; [
    coreutils
    config.wayland.windowManager.hyprland.package
    power-profiles-daemon
    inotify-tools
    jaq
    libnotify
  ];
in {
  # Power state monitor. Switches Power profiles based on charging state.
  # Plugged in - performance
  # Unplugged - power-saver
  systemd.user.services.power-monitor = {
    Unit = {
      Description = "Power Monitor";
      After = ["power-profiles-daemon.service"];
    };

    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      Type = "simple";
      ExecStart = script;
      Restart = "on-failure";
    };

    Install.WantedBy = ["default.target"];
  };
}
