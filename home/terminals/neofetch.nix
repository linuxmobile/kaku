{default, ...}: {
  programs.neofetch = {
    enable = true;
    extraConfig = ''
			print_info() {
				# info title
				# info underline
				prin ""
				prin "$(color 1)L I N U X  |  M O B I L E"
				prin _____________________
				info "" distro
				info "" model
			# info "" cpu
			# info "" gpu
				info "" memory
			# info "" kernel
				info "" packages
			# info "" resolution
				info "" term
			# info "" shell
				info "" de
			#  prin "" "Hyprland"
			# info "" locale
			# info "" uptime
				prin "" "github.com/linuxmobile"
		

			# info "GPU Driver" gpu_driver  # Linux/macOS only
			# info "CPU Usage" cpu_usage
			# info "Disk" disk
			# info "Battery" battery
			# info "Font" font
			# info "Song" song
			# [[ "$player" ]] && prin "Music Player" "$player"
			# info "Local IP" local_ip
			# info "Public IP" public_ip
			# info "Users" users
			# info "Locale" locale  # This only works on glibc systems.

			# info cols
			prin "$(mypad) $(color 1)▂▂ $(color 2)▂▂ $(color 3)▂▂ $(color 4)▂▂ $(color 5)▂▂ $(color 6)▂▂ $(color 7)▂▂ "
			prin _____________________
			}
			title_fqdn="off"

			kernel_shorthand="on"
			distro_shorthand="off"
			os_arch="off"
			uptime_shorthand="on"
			memory_percent="off"
			memory_unit="mib"
			package_managers="on"
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
			image_backend="iterm2"
			#image_source="auto"
			# image_source="$HOME/.config/neofetch/images/nix.png"
			image_source="$HOME/.config/neofetch/images/nixos.png"
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
  };
}
