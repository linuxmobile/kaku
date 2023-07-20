{default, ...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require "wezterm"

      return {
        font = wezterm.font_with_fallback {
          "${default.terminal.font}",
          "Material Symbols Outlined"
        },
        font_size = ${toString default.terminal.size},

        
       --  -- Font config 
	      -- font_rules = {
		     --  {
			    --   italic = true,
			    --   font = font_with_fallback(font_name, { italic = true }),
		     --  },
		     --  {
			    --   italic = false,
			    --   font = font_with_fallback(font_name, { bold = true }),
		     --  },
		     --  {
			    --   intensity = "Bold",
			    --   font = font_with_fallback(font_name, { bold = true }),
		     --  },
	      -- },
        color_scheme = "Catppuccin Mocha",
        window_background_opacity = ${toString default.terminal.opacity},
        enable_scroll_bar = false,
        enable_tab_bar = false,
        scrollback_lines = 10000,
        window_padding = {
          left = 25,
          right = 25,
          top = 25,
          bottom = 25,
        },
        enable_wayland = true,
        check_for_updates = false,
        default_cursor_style = "SteadyBar",
        automatically_reload_config = true,
      }
    '';
  };
}
