{
  pkgs,
  config,
  ...
}: let
  screenshot-area = pkgs.writeShellScriptBin "screenshot-area" ''
    screenshot_dir="${config.xdg.userDirs.pictures}/Screenshots"

    if [ ! -d "$screenshot_dir" ]; then
      mkdir -p "$screenshot_dir"
    fi

    workspaces=$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')
    windows=$(hyprctl clients -j | jq -r --argjson workspaces "$workspaces" 'map(select([.workspace.id] | inside($workspaces)))')

    selected_area=$(echo "$windows" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp)

    if [ -z "$selected_area" ]; then
      notify-send "Error" "Screenshot Failed."
      exit 1
    fi

    filename="$(date +%F-%H-%M-%S)-Screenshot.webp"
    file_path="$screenshot_dir/$filename"

    sss --area "$selected_area" -o raw > "$file_path"
    cat "$file_path" | wl-copy

    notify-send "Screenshot" "Screenshot Taked: $filename" -i "$file_path"
  '';
in {
  home.packages = [screenshot-area];
}
