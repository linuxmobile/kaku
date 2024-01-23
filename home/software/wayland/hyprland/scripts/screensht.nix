{
  default,
  pkgs,
  config,
  ...
}: let
  SCREENSHOTDIR = "${config.xdg.userDirs.pictures}/Screenshots";
  ORIGINALDIR = "${config.xdg.userDirs.pictures}/Original";
  LOGFILE = "${config.xdg.userDirs.pictures}.screensht.log";
  FG_COLOR = "${default.xcolors.fg}";
  BG_COLOR = "${default.xcolors.bg}";
  BG_SIZE = 10;
  BORDER_SIZE = 0;
  SHADOW_SIZE = "100x40x0x16"; # [weight] x [radius] + [horizontal] + [vertical]
  ROUNDED_CORNER = 8;
  AUTHOR_POS = ["South" "+0+15"];
  AUTHOR_NAME = " $USER";
  AUTHOR_COLOR = "${default.xcolors.color4}";

  # Get Lists Font With "convert -list font | grep -iE 'font:.*' | nl"
  FONT_SIZE = "${default.terminal.size}";
  FONT = "Maple-Mono-SC-NF-Regular";

  LATESTIMAGE = "$(eza -rth ${SCREENSHOTDIR} | rg -v '.screensht.png$' | rg '.png$' | head -n 1)";

  screensht = pkgs.writeShellScriptBin "screensht" ''
    function check() {
      if [[ $? -eq 1 && $/{PIPESTATUS[0]/} -eq 1 ]]; then
        _end_job_=$(date +%s)
        summary $_start_job_ $_end_job_ 'failed' && notify-send -u critical -t 3000 -a "Screenshot Tool" "Screensht" >>${LOGFILE} 2>&1
        exit 1
      fi
    }

    function check_dir() {
      if [[ ! -d "${SCREENSHOTDIR}" || ! -d "${ORIGINALDIR}" ]]; then
        mkdir -p "${SCREENSHOTDIR}"
        mkdir -p "${ORIGINALDIR}"
      fi
    }

    function get_latest_img() {
      ${LATESTIMAGE}

      if [[ $(echo "${LATESTIMAGE}" | wc -w) -eq 0 ]]; then
        exit 1
      else
        ${LATESTIMAGE}="${SCREENSHOTDIR}/${LATESTIMAGE}"
      fi
    }

    function summary() {
      _runtime_job_=$(($2 - $1))
      hours=$((_runtime_job_ / 3600))
      minutes=$(((_runtime_job_ % 3600) / 60))
      seconds=$(((_runtime_job_ % 3600) % 60))

      if [[ $3 != "failed" ]]; then
        wl-copy <"$_target_file_" >>${LOGFILE} 2>&1

        message="$/{_notif_message_/} Runtime: $hours hours, $minutes minutes, $seconds seconds"
        notify-send "Screenshot Tool" "$message" -i "$_target_file_" -t 10000 -a "Screenshot Tool"
      fi
    }

    function main() {
      check_dir

      rm -f ${LOGFILE}
      _start_job_=$(date +%s)

      _screenshot_command_="$1"
      _notif_message_="$2"

      $_screenshot_command_ ${SCREENSHOTDIR}\/$_start_job_.png >/dev/null 2>&1
      check

      get_latest_img
      convert

      mv ${LATESTIMAGE} ${ORIGINALDIR}

      _end_job_=$(date +%s)
      summary $_start_job_ $_end_job_
    }

    if [ -z "$1" ] || ([ "$1" != 'full' ] && [ "$1" != 'area' ]); then
      echo "
    	Requires an argument:
    	area 	- Area screenshot
    	full 	- Fullscreen screenshot
    	Example:
    	./screensht area
    	./screensht full
    	"
    elif [ "$1" = 'full' ]; then
      msg="Full screenshot saved and copied to clipboard!"
      main 'grimblast copysave output' "$/{msg/}"
    elif [ "$1" = 'area' ]; then
      msg='Area screenshot saved and copied to clipboard!'
      main 'grimblast copysave area' "$/{msg/}"
    fi

  '';
in {
  home-packages = [screensht];
}
