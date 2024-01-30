{ pkgs, config, ... }:

let
  screenshot-full = pkgs.writeShellScriptBin "screenshot-full" ''
    screenshot_dir="${config.xdg.userDirs.pictures}/Screenshots"

    if [ ! -d "$screenshot_dir" ]; then
      mkdir -p "$screenshot_dir"
    fi

    screen_id=$(hyprctl monitors -j | jq -r ".[] | select(.focused == true) | .name")

    if [ -z "$screen_id" ]; then
      notify-send "Error" "Screenshot Failed"
      exit 1
    fi

    filename="$(date +%F-%H-%M-%S)-Screenshot.webp"
    file_path="$screenshot_dir/$filename"

    sss --screen-id "$screen_id" -o raw >"$file_path"
    cat "$file_path" | wl-copy
    notify-send "Screenshot" "Screenshot Taked: $filename" -i "$file_path"
  '';
in {
  home.packages = [ screenshot-full ];
}
