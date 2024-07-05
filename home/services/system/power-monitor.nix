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
    currentStatus=$(cat "$BAT_STATUS")
    prevProfile=$AC_PROFILE
    prevStatus="Charging"

    # initial run logic
    if [[ "$currentStatus" == "Discharging" ]]; then
      profile=$BAT_PROFILE
    else
      profile=$AC_PROFILE
    fi

    # Apply initial profile settings
    if [[ $prevProfile != "$profile" ]]; then
      echo setting power profile to $profile
      powerprofilesctl set $profile
      prevProfile=$profile
      prevStatus=$currentStatus
    fi

    while true; do
      # read the current battery level and status
      level=$(cat "$BAT_CAP")
      status=$(cat "$BAT_STATUS")

      # set the profile based on the battery level and status
      if [[ $status == "Charging" ]]; then
        profile=$AC_PROFILE
        # Apply Hyprland settings for AC_PROFILE
      elif (( level > 30 )); then
        profile=$BALANCED_PROFILE
        # Apply Hyprland settings for BALANCED_PROFILE
      else
        profile=$BAT_PROFILE
        # Apply Hyprland settings for BAT_PROFILE
      fi

      # Apply Hyprland settings based on the selected profile
      for i in $(hyprctl instances -j | jaq ".[].instance" -r); do
        case $profile in
          $AC_PROFILE)
            hyprctl -i "$i" --batch 'keyword decoration:blur:enabled true; keyword animations:enabled true; keyword decoration:active_opacity 0.9; keyword decoration:inactive_opacity 0.9'
            ;;
          $BALANCED_PROFILE)
            hyprctl -i "$i" --batch 'keyword decoration:blur:enabled true; keyword animations:enabled false; keyword decoration:active_opacity 0.9; keyword decoration:inactive_opacity 0.9'
            ;;
          $BAT_PROFILE)
            hyprctl -i "$i" --batch 'keyword decoration:blur:enabled false; keyword animations:enabled false; keyword decoration:active_opacity 1.0; keyword decoration:inactive_opacity 1.0'
            ;;
        esac
      done

      # Notify and set the new profile if it has changed
      if [[ $prevProfile != "$profile" ]] || [[ $prevStatus != "$status" ]]; then
        echo setting power profile to $profile
        powerprofilesctl set $profile
        prevProfile=$profile
        prevStatus=$status
        # Send notification based on the profile
        case $profile in
          $AC_PROFILE)
            notify-send -i ac-adapter-symbolic "Power Profile Changed" "Switched to Performance profile"
            ;;
          $BALANCED_PROFILE)
            notify-send -i battery-good-symbolic "Power Profile Changed" "Switched to Balanced profile"
            ;;
          $BAT_PROFILE)
            notify-send -i battery-low-symbolic "Power Profile Changed" "Switched to Power-Saver profile"
            ;;
        esac
      fi

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
