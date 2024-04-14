{pkgs, ...}: {
  home.packages = [pkgs.neofetch];
  home.file.".config/neofetch/config.conf".text = ''
    print_info() {
    	prin ""
    	prin "$(color 1)L I N U X  |  M O B I L E"
    	prin _____________________
      info "\e[34m  " distro
      info "\e[31m " kernel
    	info "\e[33m󰍛 " memory
    	info "\e[32m " term
    	info "\e[35m " de
    	prin "" "github.com/linuxmobile"
      prin "$(mypad) $(color 1)▂▂ $(color 2)▂▂ $(color 3)▂▂ $(color 4)▂▂ $(color 5)▂▂ $(color 6)▂▂ $(color 7)▂▂ "
      prin _____________________
      }
    title_fqdn="off"

    kernel_shorthand="on"
    distro_shorthand="on"
    os_arch="off"
    uptime_shorthand="on"
    memory_percent="off"
    memory_unit="mib"
    package_managers="off"
    shell_path="off"
    shell_version="on"
    speed_type="bios_limit"
    speed_shorthand="off"
    cpu_brand="on"
    cpu_speed="on"
    cpu_cores="logical"
    cpu_temp="off"
    gpu_brand="on"
    gpu_type="all"
    refresh_rate="off"
    gtk_shorthand="off"
    gtk2="on"
    gtk3="on"
    public_ip_host="http://ident.me"
    public_ip_timeout=2
    de_version="on"
    disk_show=('/')
    disk_subtitle="mount"
    disk_percent="on"
    music_player="auto"
    song_format="%artist% - %album% - %title%"
    song_shorthand="off"
    mpc_args=()
    colors=(distro)
    bold="on"
    underline_enabled="on"
    underline_char="-"
    separator=""
    block_range=(0 15)
    color_blocks="on"
    block_width=3
    block_height=1
    col_offset="auto"
    bar_char_elapsed="-"
    bar_char_total="="
    bar_border="on"
    bar_length=15
    bar_color_elapsed="distro"
    bar_color_total="distro"
    cpu_display="off"
    memory_display="off"
    battery_display="off"
    disk_display="off"
    # Flag:     --backend
    image_backend="sixel"
    #image_source="auto"
    image_source="$HOME/.config/neofetch/images/nix.jpg"
    ascii_distro="auto"
    ascii_colors=(distro)
    ascii_bold="on"
    image_loop="on"
    thumbnail_dir="$HOME/.cache/thumbnails/neofetch"
    crop_mode="normal"
    crop_offset="center"
    image_size="220px"
    gap=4
    yoffset=0
    xoffset=0
    background_color=
    stdout="off"
  '';
}
