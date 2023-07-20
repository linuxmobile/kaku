{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.cava ];
  home.file.".config/cava/config".text = ''
		[general]
		; mode = normal
		; framerate = 60
		; autosens = 1
		; overshoot = 20
		; sensitivity = 100
		; bars = 0
		; bar_width = 2
		; bar_spacing = 1
		; bar_height = 32
		; bar_width = 20
		; bar_spacing = 5
		; lower_cutoff_freq = 50
		; higher_cutoff_freq = 10000
		; sleep_timer = 0


		[input]
		; method = pulse
		; source = auto
		; method = alsa
		; source = hw:Loopback,1
		; method = fifo
		; source = /tmp/mpd.fifo
		; sample_rate = 44100
		; sample_bits = 16
		; method = shmem
		; source = /squeezelite-AA:BB:CC:DD:EE:FF
		; method = portaudio
		; source = auto


		[output]
		; channels = stereo
		; mono_option = average
		; reverse = 0
		; raw_target = /dev/stdout
		; data_format = binary
		; bit_format = 16bit
		; ascii_max_range = 1000
		; bar_delimiter = 59
		; frame_delimiter = 10
		; sdl_width = 1000
		; sdl_height = 500
		; sdl_x = -1
		; sdl_y= -1

		[color]
		; background = default
		; foreground = default

		; background = '#111111'
		; foreground = '#33cccc'


		gradient = 1
		gradient_count = 8
		gradient_color_1 = '#94e2d5'
		gradient_color_2 = '#89dceb'
		gradient_color_3 = '#74c7ec'
		gradient_color_4 = '#89b4fa'
		gradient_color_5 = '#cba6f7'
		gradient_color_6 = '#f5c2e7'
		gradient_color_7 = '#eba0ac'
		gradient_color_8 = '#f38ba8'

		; gradient_color_1 = '#D5CADE'
		; gradient_color_2 = '#DCC7CC'
		; gradient_color_3 = '#E8C4AE'
		; gradient_color_4 = '#F1C096'
		; gradient_color_5 = '#F6BE89'
		; gradient_color_6 = '#FDBC78'

		[smoothing]
		; integral = 77
		; monstercat = 0
		; waves = 0
		; gravity = 100
		; ignore = 0
		noise_reduction = 0.77


		[eq]
		; 1 = 1 # bass
		; 2 = 1
		; 3 = 1 # midtone
		; 4 = 1
		; 5 = 1 # treble
    '';
}
