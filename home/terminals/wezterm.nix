{default, ...}: {
  programs.wezterm = {
    enable = true;
    colorSchemes = {
      followSystem = {
        background = "${default.xcolors.background}";
        cursor_bg = "${default.xcolors.foreground}";
        cursor_border = "${default.xcolors.foreground}";
        cursor_fg = "${default.xcolors.color8}";
        foreground = "${default.xcolors.foreground}";
        selection_bg = "${default.xcolors.color15}";
        selection_fg = "${default.xcolors.background}";
        split = "${default.xcolors.mbg}";
        ansi = [
          "${default.xcolors.color0}"
          "${default.xcolors.color1}"
          "${default.xcolors.color2}"
          "${default.xcolors.color3}"
          "${default.xcolors.color4}"
          "${default.xcolors.color5}"
          "${default.xcolors.color6}"
          "${default.xcolors.color7}"
        ];
        brights = [
          "${default.xcolors.color8}"
          "${default.xcolors.color9}"
          "${default.xcolors.color10}"
          "${default.xcolors.color11}"
          "${default.xcolors.color12}"
          "${default.xcolors.color13}"
          "${default.xcolors.color14}"
          "${default.xcolors.color15}"
        ];
        tab_bar = {
          background = "${default.xcolors.color8}";
          active_tab = {
            bg_color = "${default.xcolors.background}";
            fg_color = "${default.xcolors.foreground}";
          };
          inactive_tab = {
            bg_color = "${default.xcolors.color8}";
            fg_color = "${default.xcolors.foreground}";
          };
          inactive_tab_hover = {
            bg_color = "${default.xcolors.color0}";
            fg_color = "${default.xcolors.foreground}";
          };
          inactive_tab_edge = "${default.xcolors.color0}";
          new_tab = {
            bg_color = "${default.xcolors.color8}";
            fg_color = "${default.xcolors.color7}";
          };
          new_tab_hover = {
            bg_color = "${default.xcolors.color0}";
            fg_color = "${default.xcolors.foreground}";
          };
        };
      };
    };
    extraConfig = ''
      local wezterm = require ("wezterm")

      local function font_with_fallback(name, params)
        local names = { name, "Material Symbols Outlined"}
        return wezterm.font_with_fallback(names, params)
      end

      local font_name = "${default.terminal.font}"

      return {
        font_size = ${toString default.terminal.size},

       -- Font config
        font = font_with_fallback(font_name),
        font_rules = {
           {
             italic = true,
             font = font_with_fallback(font_name, { italic = true }),
           },
           {
             italic = false,
             font = font_with_fallback(font_name, { bold = true }),
           },
           {
             intensity = "Bold",
             font = font_with_fallback(font_name, { bold = true }),
           },
         },

        color_scheme = "followSystem",
        window_background_opacity = ${toString default.terminal.opacity},
        warn_about_missing_glyphs = false,
        enable_scroll_bar = false,
        enable_tab_bar = false,
        scrollback_lines = 10000,
        window_padding = {
          left = 25,
          right = 25,
          top = 25,
          bottom = 25,
        },
        enable_wayland = false,
        check_for_updates = false,
        default_cursor_style = "SteadyBar",
        automatically_reload_config = true,

        disable_default_key_bindings = true,
        keys = {
          {
            key = "q",
            mods = "CTRL",
            action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
          },
          {
            key = "v",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ PasteFrom = "Clipboard" }),
          },
          {
            key = "c",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
          },
          },
            window_close_confirmation = "NeverPrompt",
          }
    '';
  };
}
